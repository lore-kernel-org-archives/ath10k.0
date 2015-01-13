Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YB1eP-0001vg-Cm
 for ath10k@lists.infradead.org; Tue, 13 Jan 2015 13:36:54 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: Checking on interest in some patches...
References: <54A45615.1050401@candelatech.com>
Date: Tue, 13 Jan 2015 15:36:21 +0200
In-Reply-To: <54A45615.1050401@candelatech.com> (Ben Greear's message of "Wed, 
 31 Dec 2014 12:01:25 -0800")
Message-ID: <878uh67qga.fsf@kamboji.qca.qualcomm.com>
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
To: Ben Greear <greearb@candelatech.com>
Cc: ath10k <ath10k@lists.infradead.org>

Ben Greear <greearb@candelatech.com> writes:

> Previously, I was at a dead end trying to get support for CT firmware features,
> expanded crash dump features, and other things accepted upstream.
>
> I am working on porting my changes to the 3.19 kernel, and was curious if
> there is any change of opinion on possibly accepting at least some CT firmware
> support or the crash dump features.  If so, I'll clean up and re-post once
> I have tested them.

We have now four different firmware branches to support and I fear even
more to come. Adding yet another branch is quite daunting from
maintenance point of view.

Crash dump support is already upstream, but what's missing is porting it
to use Johannes' device coredump (commit 833c95456a70) and RAM dump
part. (And I guess we also want some sort register dump?)

Last year I implemented the RAM dump part, but only did some quick
verification and that's why I haven't submitted it yet. I think I need
to submit it as RFC instead of bitrotting on my hard drive.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
