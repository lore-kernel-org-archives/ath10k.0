Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WQuzw-0004ae-No
 for ath10k@lists.infradead.org; Fri, 21 Mar 2014 08:40:17 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: Failure to allocate large memory blocks upon firmware crash
References: <CAHqTa-3=VZr2-S63HXEX++Y5BvPRuUTKgB_nKhpCCUYD-nGe+A@mail.gmail.com>
Date: Fri, 21 Mar 2014 10:39:48 +0200
In-Reply-To: <CAHqTa-3=VZr2-S63HXEX++Y5BvPRuUTKgB_nKhpCCUYD-nGe+A@mail.gmail.com>
 (Avery Pennarun's message of "Wed, 19 Mar 2014 22:42:06 -0400")
Message-ID: <87y504aqsr.fsf@kamboji.qca.qualcomm.com>
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
To: Avery Pennarun <apenwarr@gmail.com>
Cc: ath10k <ath10k@lists.infradead.org>

Hi Avery,

replying in smaller parts, easier to discuss that way.

Avery Pennarun <apenwarr@gmail.com> writes:

> We are still getting firmware crashes occasionally, but I haven't
> narrowed down the cause nor tried the very latest driver, so I won't
> bother you with those just yet.

Even if you are not using the latest and greatest ath10k I think you
should still post the firmware crashes. Then we can try to analyse
what's causing them.

What I'm wondering is that why you seem to have firmware crashes so
often. For example, I'm not seeing anything like that on our MIPS based
AP135 platform. Maybe there are more memory barrier issues like you
reported earlier?

What kind of platform are you using? Does it have any special
characteristics related to cache coherency, PCI access or similar?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
