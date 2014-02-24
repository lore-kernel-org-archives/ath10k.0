Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.duncanthrax.net ([2001:470:70c5:1111::170])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WHr9F-0003WO-4y
 for ath10k@lists.infradead.org; Mon, 24 Feb 2014 08:44:26 +0000
Received: from port-92-198-130-130.static.qsc.de ([92.198.130.130]
 helo=[10.128.129.30])
 by smtp.eurescom.eu with esmtpsa (TLSv1:DHE-RSA-CAMELLIA256-SHA:256)
 (Exim 4.80.1) (envelope-from <svens@stackframe.org>)
 id 1WHr8q-0006OD-Ex
 for ath10k@lists.infradead.org; Mon, 24 Feb 2014 09:44:00 +0100
Message-ID: <530B0670.1010009@stackframe.org>
Date: Mon, 24 Feb 2014 09:44:32 +0100
From: Sven Schnelle <svens@stackframe.org>
MIME-Version: 1.0
Subject: Re: nl80211: Failed to set channel
References: <00ea01cee403$5331f1e0$f995d5a0$@sparklan.com>
 <00d101cee597$e8c57480$ba505d80$@sparklan.com>
 <52A592B7.9000806@intec.ugent.be>
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
 <530A64E5.2040401@intec.ugent.be>
In-Reply-To: <530A64E5.2040401@intec.ugent.be>
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
To: ath10k@lists.infradead.org

On 02/23/2014 10:15 PM, Bart Jooris wrote:
> nl80211: Regulatory information - country=FI
>      nl80211: 2402-2482 @ 40 MHz 20 mBm
>      nl80211: 5170-5250 @ 40 MHz 20 mBm
>      nl80211: 5250-5330 @ 40 MHz 20 mBm
>      nl80211: 5490-5710 @ 40 MHz 27 mBm
You need to update your regulatory database. Your version doesn't
allow 80MHz wide channels.

Sven.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
