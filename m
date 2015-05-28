Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YxyUb-0007Ha-NW
 for ath10k@lists.infradead.org; Thu, 28 May 2015 14:09:07 +0000
Message-ID: <55672169.8080209@candelatech.com>
Date: Thu, 28 May 2015 07:08:41 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: compiling decode_ath10k.cc with clang/llvm
References: <CAJ-VmonBGgLdLy8KQwYt81+2tfMYzw+OY+VMSCmGy315wUP+EQ@mail.gmail.com>
In-Reply-To: <CAJ-VmonBGgLdLy8KQwYt81+2tfMYzw+OY+VMSCmGy315wUP+EQ@mail.gmail.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Adrian Chadd <adrian@freebsd.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

That is from my private tree, so list cannot help you...

Looks like real bugs...I'll make attempt at fixing it.

Thanks,
Ben


On 05/27/2015 11:43 PM, Adrian Chadd wrote:
> Hi,
>
> I'm doing firmware bringup on freebsd, and I've hit a snag with
> decode_ath10k.cc:
>
> Suspended
> adrian@lucy-11i386:~/git/dev.qualcomm.com/greaarb/ath10k-firmware % ./BUILDME.sh
> decode_ath10k.cc:1266:28: error: use of logical '&&' with constant
> operand [-Werror,-Wconstant-logical-operand]
>               (ps_reg >> 8) && 0xf, (ps_reg >> 16) & 0x3, !!(ps_reg >> 18));
>                             ^  ~~~
> decode_ath10k.cc:1266:28: note: use '&' for a bitwise operation
>               (ps_reg >> 8) && 0xf, (ps_reg >> 16) & 0x3, !!(ps_reg >> 18));
>                             ^~
>                             &
> decode_ath10k.cc:1266:28: note: remove constant to silence this warning
>               (ps_reg >> 8) && 0xf, (ps_reg >> 16) & 0x3, !!(ps_reg >> 18));
>                            ~^~~~~~
> decode_ath10k.cc:1407:37: error: comparison of unsigned expression >=
> 0 is always true [-Werror,-Wtautological-compare]
>                          if ((sp_idx >= 0) && (sp_idx < len)) {
>                               ~~~~~~ ^  ~
> decode_ath10k.cc:2019:23: error: format specifies type 'unsigned
> short' but the argument has type 'unsigned char' [-Werror,-Wformat]
>        printf("%02hx", header.uuid[i]);
>                ~~~~~   ^~~~~~~~~~~~~~
>                %02hhx
>
> .. would someone who can use the firmware try fixing the source and
> see if it still does the right thing?
>
>
> -a
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k
>

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
