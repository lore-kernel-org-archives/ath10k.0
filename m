Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bLPb1-0006Zw-NW
 for ath10k@lists.infradead.org; Fri, 08 Jul 2016 06:49:08 +0000
MIME-Version: 1.0
Subject: Re: [v2,3/5] ath10k: Add WARN_ON if we over-write peer-map pointer.
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1459545132-11295-3-git-send-email-greearb@candelatech.com>
Message-ID: <de2f7017a0ef446d994f1e8f6b2ed9fd@euamsexm01a.eu.qualcomm.com>
Date: Fri, 8 Jul 2016 08:48:40 +0200
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
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Ben Greear <greearb@candelatech.com> wrote:
> From: Ben Greear <greearb@candelatech.com>
> 
> Not sure this can happen, but seems like a reasonable sanity
> check.
> 
> Signed-off-by: Ben Greear <greearb@candelatech.com>

Thanks, 2 patches applied to ath-next branch of ath.git:

c5ace87a886d ath10k: Add WARN_ON if we over-write peer-map pointer.
d0eeafad1189 ath10k: Clean up peer when sta goes away.

-- 
Sent by pwcli
https://patchwork.kernel.org/patch/8727861/


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
