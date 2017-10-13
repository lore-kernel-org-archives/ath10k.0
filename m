Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e2yJC-0001nY-Ur
 for ath10k@lists.infradead.org; Fri, 13 Oct 2017 11:39:20 +0000
MIME-Version: 1.0
Subject: Re: ath10k: check power save support in STA mode through FW IE
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <150670357817.24239.7065449335785410650.stgit@potku.adurom.net>
References: <150670357817.24239.7065449335785410650.stgit@potku.adurom.net>
Message-ID: <1cded68ebc944a2791525c1065056ef7@euamsexm01e.eu.qualcomm.com>
Date: Fri, 13 Oct 2017 13:38:51 +0200
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Kalle Valo <kvalo@qca.qualcomm.com> wrote:

> Currently ath10k host enables power save support in station mode by
> default for all firmwares but Power save for station mode still not supported
> in some of the firmware versions. Which results in firmware crash while
> issueing multiple scan commands.
> 
> Fix this problem by introducing new FW feature flag to check power save
> support in firmware and then the firmware image can tell to ath10k that power
> save mode is not supported in station mode.
> 
> Signed-off-by: Venkateswara Naralasetty <vnaralas@qti.qualcomm.com>
> Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>

Patch applied to ath-next branch of ath.git, thanks.

36d9cdb6fb4a ath10k: check power save support in STA mode through FW IE

-- 
https://patchwork.kernel.org/patch/9978455/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
