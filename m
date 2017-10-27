Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e851Q-0005SN-66
 for ath10k@lists.infradead.org; Fri, 27 Oct 2017 13:50:06 +0000
MIME-Version: 1.0
Subject: Re: ath10k: spectral: Remove redundant check
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1507974075-6987-1-git-send-email-chris.gekas@gmail.com>
References: <1507974075-6987-1-git-send-email-chris.gekas@gmail.com>
Message-ID: <5f9c14b73128416da92cca6fcd69dd4d@euamsexm01a.eu.qualcomm.com>
Date: Fri, 27 Oct 2017 15:49:36 +0200
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
To: Christos Gkekas <chris.gekas@gmail.com>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org

Christos Gkekas <chris.gekas@gmail.com> wrote:

> Variable val is unsigned, so checking whether it is less than zero is
> redundant.
> 
> Signed-off-by: Christos Gkekas <chris.gekas@gmail.com>
> Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>

Patch applied to ath-next branch of ath.git, thanks.

d83c0d3293bb ath10k: spectral: remove redundant check in write_file_spectral_count()

-- 
https://patchwork.kernel.org/patch/10006335/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
