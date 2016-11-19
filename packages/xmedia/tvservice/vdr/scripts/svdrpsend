#!/usr/bin/python
# -*- coding: utf8 -*-
from collections import namedtuple
import re
import socket
import logging


CRLF = '\r\n'

Response = namedtuple('Response', 'code delim text')

class SVDRPException(Exception):
    pass


class SVDRP(object):
    """Base class for network communication with VDR with the Simple VDR Protocol (SVDRP)"""
    def __init__(self, hostname='localhost', port=6419, timeout=10, debug_dump=None):
        self.logger = logging.getLogger(__name__)
        self.hostname = hostname
        self.port = port
        self.socket = None
        self.sfile = None
        self.timeout = timeout
        self.response = []
        self.debug_dump = debug_dump
        response_pat = r'^(\d+)(\s|-)(.+)$'
        self.response_re = re.compile(response_pat)

    def start_conversation(self):
        self.response = []
        self.logger.debug('Start conversation with %s:%s.', self.hostname, self.port)
        if self.debug_dump is not None:
            self.debug_file = open(self.debug_dump, 'w')
            self.logger.warning('Debug dry mode - dump all commands to %s dump file', self.debug_dump)
            return []
        else:
            self.socket = socket.create_connection((self.hostname, self.port), self.timeout)
            self.sfile = self.socket.makefile('r')
            return self.receive_response()

    def finish_conversation(self):
        self.logger.debug('Finish conversation with %s:%s.', self.hostname, self.port)
        cmd_result = self.send_command('quit')
        if self.debug_dump is not None:
            self.debug_file.close()
        else:
            self.sfile.close()
            self.socket.close()
            self.sfile = self.socket = None
        return cmd_result

    def send(self, cmd):
        self.logger.debug('Send %s to host', repr(cmd))
        cmd += CRLF
        if isinstance(cmd, unicode):
            #TODO We should read VDR encoding in start_conversation
            cmd = cmd.encode("utf-8")
        if self.debug_dump is not None:
            self.debug_file.write(cmd)
        else:
            self.socket.sendall(cmd)

    def send_command(self, cmd):
        self.send(cmd)
        return self.receive_response()

    def parse_response(self, response_str):
        m = self.response_re.search(response_str)
        if m:
            return Response(int(m.group(1)), m.group(2), m.group(3))
        else:
            raise ValueError('Invalid response: %s' % response_str)

    def receive_response(self, flag=0):
        self.logger.debug('Getting response...')
        if self.debug_dump is not None:
            self.logger.warning('Debug dry mode - return empty response')
            return []
        next_index = len(self.response)
        for rline in self.sfile:
            self.logger.debug('Got line %s.', repr(rline))
            resp = self.parse_response(rline)
            self.response.append(resp)
            if resp.delim != '-':
                #no more lines expected
                break
        else:
            self.logger.debug('Empty response.')
        self.logger.debug('Got response.')
        return self.response[next_index:]

    def get_full_response(self):
        return self.response


if __name__ == '__main__':
    from optparse import OptionParser
    usage = "usage: %prog [options] command..."
    parser = OptionParser(usage)
    parser.add_option("-d", "--host", action="store", type="string", dest="hostname", default='localhost',
                      help="destination hostname (default: localhost)")
    parser.add_option("-p", "--port", action="store", type="int", dest="port", default=6419,
                      help="SVDRP port number (default: 6419)")
    parser.add_option("-v", "--verbose", action="store_true", dest="verbose",
                      help="verbose output with debug info")
    parser.add_option("-t", "--debug-dump", action="store", type="string", dest="debug_dump",
                      help="Debug dry mode - dump all commands to file, no actual commands send to host")

    (options, args) = parser.parse_args()
    if len(args) == 0:
        parser.error("missing command")
    if options.verbose:
        logging.basicConfig(level=logging.DEBUG)
    else:
        logging.basicConfig()
    vdr_command = " ".join(args)
    logging.debug('Command: %s', vdr_command)
    svdrp = SVDRP(hostname=options.hostname, port=options.port, debug_dump=options.debug_dump)
    svdrp.start_conversation()
    svdrp.send_command(vdr_command)
    svdrp.finish_conversation()
    cmd_result = svdrp.get_full_response()
    for resp_line in cmd_result:
        print '%s%s%s' % (resp_line.code, resp_line.delim, resp_line.text)
