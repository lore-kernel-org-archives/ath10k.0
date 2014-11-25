Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XtBBF-00070k-BQ
 for ath10k@lists.infradead.org; Tue, 25 Nov 2014 08:09:01 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 1/2] ath10k: move create-ht-cap methods above set-antenna.
References: <1411576506-11815-1-git-send-email-greearb@candelatech.com>
Date: Tue, 25 Nov 2014 10:08:32 +0200
In-Reply-To: <1411576506-11815-1-git-send-email-greearb@candelatech.com>
 (greearb@candelatech.com's message of "Wed, 24 Sep 2014 09:35:05
 -0700")
Message-ID: <874mtn3dof.fsf@kamboji.qca.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

greearb@candelatech.com writes:

> From: Ben Greear <greearb@candelatech.com>
>
> We will need to use these in set-antenna, so move them
> so that we do not have to define the method signatures.
>
> Signed-off-by: Ben Greear <greearb@candelatech.com>

I'm dropping these two patches. Please resend once we figure out how to
handle the band updated.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
