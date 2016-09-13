Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bjmnh-0001IA-It
 for ath10k@lists.infradead.org; Tue, 13 Sep 2016 12:26:58 +0000
MIME-Version: 1.0
Subject: Re: ath10k: enable peer stats by default
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1473188728-14995-1-git-send-email-twp@qca.qualcomm.com>
Message-ID: <4a5367aa45274f368f50b790b06ab618@euamsexm01a.eu.qualcomm.com>
Date: Tue, 13 Sep 2016 14:26:28 +0200
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
To: "Pedersen, Thomas" <twp@qca.qualcomm.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>

"Pedersen, Thomas" <twp@qca.qualcomm.com> wrote:
> IFTYPE_MESH_POINT need to rely on these for accurate path
> selection metrics. Other modes will probably also find
> them useful. Enabling peer stats has the side effect of
> reducing max number of STAs from 128 to 118. There should
> be negligible performance impact.
> 
> If users really need 128 STAs and don't mind losing out on
> peer stats, they can still disable them:
> 
> echo 0 > debugfs/ieee80211/phyn/ath10k/peer_stats
> 
> Signed-off-by: Thomas Pedersen <twp@qca.qualcomm.com>

Thanks, 1 patch applied to ath-next branch of ath.git:

8c1d7fa53166 ath10k: enable peer stats by default

-- 
Sent by pwcli
https://patchwork.kernel.org/patch/9317865/


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
