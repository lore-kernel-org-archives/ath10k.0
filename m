Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by merlin.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cvffY-0001Wn-RQ
 for ath10k@lists.infradead.org; Wed, 05 Apr 2017 07:47:57 +0000
MIME-Version: 1.0
Subject: Re: ath10k: use octal permission representation
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1487598027-17324-1-git-send-email-marcin.rokicki@tieto.com>
References: <1487598027-17324-1-git-send-email-marcin.rokicki@tieto.com>
Message-ID: <4cd6337dd89647aa8693d0c1c2d7fa71@euamsexm01a.eu.qualcomm.com>
Date: Wed, 5 Apr 2017 09:44:25 +0200
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
To: Marcin Rokicki <marcin.rokicki@tieto.com>
Cc: ath10k@lists.infradead.org

Marcin Rokicki <marcin.rokicki@tieto.com> wrote:
> Fix output from checkpatch.pl like:
>  Symbolic permissions 'S_IRUSR' are not preferred.
>  Consider using octal permissions '0400'.
> 
> Signed-off-by: Marcin Rokicki <marcin.rokicki@tieto.com>

Patch applied to ath-next branch of ath.git, thanks.

53c8d48bb723 ath10k: use octal permission representation

-- 
https://patchwork.kernel.org/patch/9582889/

Documentation about submitting wireless patches and checking status
from patchwork:

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
