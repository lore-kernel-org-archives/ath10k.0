Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cMtEM-0004FY-KU
 for ath10k@lists.infradead.org; Fri, 30 Dec 2016 09:12:07 +0000
MIME-Version: 1.0
Subject: Re: [2/2] ath10k: fix potential memory leak in
 ath10k_wmi_tlv_op_pull_fw_stats()
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <e0909741dfae742197d5f5d60709d225cc179b42.1480974623.git.chunkeey@googlemail.com>
References: <e0909741dfae742197d5f5d60709d225cc179b42.1480974623.git.chunkeey@googlemail.com>
Message-ID: <afc9362500004eab995c4f1d5d16fcd9@euamsexm01a.eu.qualcomm.com>
Date: Fri, 30 Dec 2016 10:11:38 +0100
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
To: Christian Lamparter <chunkeey@googlemail.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Christian Lamparter <chunkeey@googlemail.com> wrote:
> ath10k_wmi_tlv_op_pull_fw_stats() uses tb = ath10k_wmi_tlv_parse_alloc(...)
> function, which allocates memory. If any of the three error-paths are
> taken, this tb needs to be freed.
> 
> Signed-off-by: Christian Lamparter <chunkeey@googlemail.com>

Patch applied to ath-next branch of ath.git, thanks.

097e46d2ae90 ath10k: fix potential memory leak in ath10k_wmi_tlv_op_pull_fw_stats()

-- 
https://patchwork.kernel.org/patch/9461627/

Documentation about submitting wireless patches and checking status
from patchwork:

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
