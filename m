Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ie0-x233.google.com ([2607:f8b0:4001:c03::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YxrYF-0007ZR-M6
 for ath10k@lists.infradead.org; Thu, 28 May 2015 06:44:24 +0000
Received: by iepj10 with SMTP id j10so31183094iep.3
 for <ath10k@lists.infradead.org>; Wed, 27 May 2015 23:44:01 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 27 May 2015 23:43:58 -0700
Message-ID: <CAJ-VmonBGgLdLy8KQwYt81+2tfMYzw+OY+VMSCmGy315wUP+EQ@mail.gmail.com>
Subject: compiling decode_ath10k.cc with clang/llvm
From: Adrian Chadd <adrian@freebsd.org>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Hi,

I'm doing firmware bringup on freebsd, and I've hit a snag with
decode_ath10k.cc:

Suspended
adrian@lucy-11i386:~/git/dev.qualcomm.com/greaarb/ath10k-firmware % ./BUILDME.sh
decode_ath10k.cc:1266:28: error: use of logical '&&' with constant
operand [-Werror,-Wconstant-logical-operand]
             (ps_reg >> 8) && 0xf, (ps_reg >> 16) & 0x3, !!(ps_reg >> 18));
                           ^  ~~~
decode_ath10k.cc:1266:28: note: use '&' for a bitwise operation
             (ps_reg >> 8) && 0xf, (ps_reg >> 16) & 0x3, !!(ps_reg >> 18));
                           ^~
                           &
decode_ath10k.cc:1266:28: note: remove constant to silence this warning
             (ps_reg >> 8) && 0xf, (ps_reg >> 16) & 0x3, !!(ps_reg >> 18));
                          ~^~~~~~
decode_ath10k.cc:1407:37: error: comparison of unsigned expression >=
0 is always true [-Werror,-Wtautological-compare]
                        if ((sp_idx >= 0) && (sp_idx < len)) {
                             ~~~~~~ ^  ~
decode_ath10k.cc:2019:23: error: format specifies type 'unsigned
short' but the argument has type 'unsigned char' [-Werror,-Wformat]
      printf("%02hx", header.uuid[i]);
              ~~~~~   ^~~~~~~~~~~~~~
              %02hhx

.. would someone who can use the firmware try fixing the source and
see if it still does the right thing?


-a

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
