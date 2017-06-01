Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dGPsc-0000L7-B0
 for ath10k@lists.infradead.org; Thu, 01 Jun 2017 13:11:11 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [2/3] ath10k: Fix napi related crash when otp fails.
Date: Thu, 1 Jun 2017 13:10:46 +0000
Message-ID: <87zidrlupz.fsf@kamboji.qca.qualcomm.com>
References: <1494883540-18558-2-git-send-email-greearb@candelatech.com>
 <cbad3de9ad8349ddb59e17d7d043000d@euamsexm01a.eu.qualcomm.com>
 <33cae296-755f-a60a-85fd-18b1441a01fd@candelatech.com>
In-Reply-To: <33cae296-755f-a60a-85fd-18b1441a01fd@candelatech.com> (Ben
 Greear's message of "Wed, 31 May 2017 06:11:51 -0700")
Content-Language: en-US
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
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Ben Greear <greearb@candelatech.com> writes:

>> Doesn't the commit below fix this?
>
> I don't know, but the problem in my case is that napi wasn't properly stopped,
> and the patch you reference is just about starting napi earlier, right?

IIRC I moved it to a different function which was called later. This was
just to match the symmetry with napi_disable() and fix the error
handling.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
