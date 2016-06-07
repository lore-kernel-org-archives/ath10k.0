Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bAFLc-0006Vi-MH
 for ath10k@lists.infradead.org; Tue, 07 Jun 2016 11:39:05 +0000
MIME-Version: 1.0
Subject: Re: [v2,01/21] ath10k: Fix crash related to printing features.
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1462986153-16318-2-git-send-email-greearb@candelatech.com>
Message-ID: <e2a4492749b54436ae1476c36adbcd20@euamsexm01a.eu.qualcomm.com>
Date: Tue, 7 Jun 2016 13:38:37 +0200
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
> This looks like a regression from
> c4cdf753 (move fw_features to struct ath10k_fw_file)
> 
> Signed-off-by:  Ben Greear <greearb@candelatech.com>

Thanks, 1 patch applied to ath-current branch of ath.git:

8d0a0710ea0d ath10k: fix crash related to printing features

-- 
Sent by pwcli
https://patchwork.kernel.org/patch/9073471/


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
