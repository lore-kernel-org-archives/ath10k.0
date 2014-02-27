Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WJ3NY-0002aC-H5
 for ath10k@lists.infradead.org; Thu, 27 Feb 2014 16:00:09 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Running throughput tests
References: <00ea01cee403$5331f1e0$f995d5a0$@sparklan.com>
 <006301cef71c$d850ec10$88f2c430$@sparklan.com>
 <52A98706.7080907@intec.ugent.be>
 <008d01cef722$2a9c05e0$7fd411a0$@sparklan.com>
 <52A9DEF9.8080305@intec.ugent.be>
 <012e01cef7e0$99017e70$cb047b50$@sparklan.com>
 <52AACFB9.8080901@intec.ugent.be>
 <006301cefa3c$44c07b50$ce4171f0$@sparklan.com>
 <52AEC26B.2060400@intec.ugent.be>
 <007f01cefa41$8a940de0$9fbc29a0$@sparklan.com>
 <52AEE61F.5030505@intec.ugent.be>
 <006b01cefacb$6c0b2d60$44218820$@sparklan.com>
 <52B00B10.3050300@intec.ugent.be>
 <004b01cefb9d$04a543e0$0defcba0$@sparklan.com>
 <52B2AE75.9050206@intec.ugent.be>
 <00df01cf0090$05944f10$10bced30$@sparklan.com>
 <52B9672E.9000701@intec.ugent.be>
 <008c01cf012e$e59563d0$b0c02b70$@sparklan.com>
 <530A64E5.2040401@intec.ugent.be> <530B0670.1010009@stackframe.org>
 <530E5EF2.8070800@intec.ugent.be>
Date: Thu, 27 Feb 2014 17:59:32 +0200
In-Reply-To: <530E5EF2.8070800@intec.ugent.be> (Bart Jooris's message of "Wed, 
 26 Feb 2014 22:38:58 +0100")
Message-ID: <87y50weecb.fsf_-_@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
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
To: Bart.Jooris@intec.ugent.be
Cc: ath10k@lists.infradead.org

Changing subject.

Bart Jooris <Bart.Jooris@intec.ugent.be> writes:

> I have a new install with:
> -Ubuntu 12.04 LTS (no support for ath10k yet)
> -got firmware via https://github.com/kvalo/ath10k-firmware/
> -builded linux-3.13.5 to have the ath10k modules (nog atk10k from
> source see my mail of 24 Feb)
> -builded hostapd, wireless-regdb and crda from source
>
> and I have 80MHz wide channels now :-)
>
> Just got a stable 160Mbps (iperf udp, tweeking the distance and ended
> up around 50cm) on a Ubuntu 13.10 client (regulatory.bin still not
> ok).
> Not yet the 300Mbps as I read earlier on the thread.
> What could be the next steps to speed up the link?

First I would use the full hostapd configuration which I just added to
the wiki:

http://wireless.kernel.org/en/users/Drivers/ath10k/configuration#Full_hostapd_configuration

Next I would disable all possible debug features from kernel and make
sure that they are not included in the build. And last try to find a
free channel with little interference as possible.

I'm sure others have better ideas.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
