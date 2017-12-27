Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eU8f6-0003qm-W7
 for ath10k@lists.infradead.org; Wed, 27 Dec 2017 10:10:14 +0000
MIME-Version: 1.0
Subject: Re: [v2,1/3] ath10k: Add SNOC bus type for WCN3990 target
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1513872322-26636-2-git-send-email-pillair@qti.qualcomm.com>
References: <1513872322-26636-2-git-send-email-pillair@qti.qualcomm.com>
Message-ID: <aa68f584e8744ab68fcf2f39edf13fe4@euamsexm01a.eu.qualcomm.com>
Date: Wed, 27 Dec 2017 11:09:55 +0100
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
To: Rakesh Pillai <pillair@qti.qualcomm.com>
Cc: Govind Singh <govinds@qti.qualcomm.com>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Rakesh Pillai <pillair@qti.qualcomm.com> wrote:

> WCN3990 is integrated chipset which uses system NOC.
> Add SNOC bus type and related definitions.
> 
> Signed-off-by: Govind Singh <govinds@qti.qualcomm.com>
> Signed-off-by: Rakesh Pillai <pillair@qti.qualcomm.com>
> Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>

3 patches applied to ath-next branch of ath.git, thanks.

63855e3d6e7a ath10k: Add SNOC bus type for WCN3990 target
b796240409b3 ath10k: Add debug mask for SNOC bus type
71e9c29fbd28 ath10k: Add fw feature flag for non-bmi firmware load

-- 
https://patchwork.kernel.org/patch/10127929/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
