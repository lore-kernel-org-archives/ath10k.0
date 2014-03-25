Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WSQ19-00028k-Tn
 for ath10k@lists.infradead.org; Tue, 25 Mar 2014 11:59:44 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 1/4 v2] ath10k:  add debugging for tx-credits usage
References: <1395688844-24640-1-git-send-email-greearb@candelatech.com>
Date: Tue, 25 Mar 2014 13:59:12 +0200
In-Reply-To: <1395688844-24640-1-git-send-email-greearb@candelatech.com>
 (greearb@candelatech.com's message of "Mon, 24 Mar 2014 12:20:40
 -0700")
Message-ID: <87y4zy1obz.fsf@kamboji.qca.qualcomm.com>
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
> This helps track tx credits accounting and usage.  If
> firmware hangs or otherwise fails to return credits, one
> can more easily see the last few command types that
> was sent to the firmware.
>
> Signed-off-by: Ben Greear <greearb@candelatech.com>
> ---
>
> v2:  Improve comments.  Issue of using __LINE__ is not resolved.

I'm going to drop this patch 1 for now, I'm not really fond of the idea
using line numbers in debug messages. Hopefully we find an alternative
solution, like what Michal proposed.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
