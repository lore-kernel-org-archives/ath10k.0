Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bjmmE-0008JU-HW
 for ath10k@lists.infradead.org; Tue, 13 Sep 2016 12:25:27 +0000
MIME-Version: 1.0
Subject: Re: [V2] ath10k: fix memory leak on caldata on error exit path
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <20160903163819.13115-1-colin.king@canonical.com>
Message-ID: <c603113a967a45c18ddce5deff55b753@euamsexm01a.eu.qualcomm.com>
Date: Tue, 13 Sep 2016 14:24:40 +0200
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
To: Colin Ian King <colin.king@canonical.com>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org

Colin Ian King <colin.king@canonical.com> wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> caldata is not being free'd on the error exit path, causing
> a memory leak and data definitely should not be freed. Free
> caldata instead of data.
> 
> Thanks to Kalle Valo for spotting that data should not be
> free'd.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Thanks, 1 patch applied to ath-next branch of ath.git:

5f4761dda2ba ath10k: fix memory leak on caldata on error exit path

-- 
Sent by pwcli
https://patchwork.kernel.org/patch/9312163/


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
