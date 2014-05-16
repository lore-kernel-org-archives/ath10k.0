Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WlHSL-0002Un-Vh
 for ath10k@lists.infradead.org; Fri, 16 May 2014 12:41:46 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k:  Ensure rx-frag ignores rssi.
References: <1400178923-26306-1-git-send-email-greearb@candelatech.com>
Date: Fri, 16 May 2014 15:41:17 +0300
In-Reply-To: <1400178923-26306-1-git-send-email-greearb@candelatech.com>
 (greearb@candelatech.com's message of "Thu, 15 May 2014 11:35:23
 -0700")
Message-ID: <874n0p7v6a.fsf@kamboji.qca.qualcomm.com>
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
To: greearb@candelatech.com
Cc: ath10k@lists.infradead.org

greearb@candelatech.com writes:

> From: Ben Greear <greearb@candelatech.com>
>
> It seems ath10k firmware gives us no way to know
> the rssi for rx-fragments.
>
> Signed-off-by: Ben Greear <greearb@candelatech.com>

Janusz, are you ok with this?

> Patch is against my tree, hopefully will apply OK against upstream
> but have not tested that yet.

Perfect, thanks for telling me this. Then I can just drop the patch if
it doesn't apply. Oh, and it did apply cleanly to ath-next-test.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
