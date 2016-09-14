Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bk9FT-00073a-27
 for ath10k@lists.infradead.org; Wed, 14 Sep 2016 12:25:07 +0000
MIME-Version: 1.0
Subject: Re: [1/2] ath10k: handle testmode events for 10.2 based firmware
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <20160603153328.11947-1-rmanohar@qti.qualcomm.com>
Message-ID: <20496dae439740198669bc2de651ca50@euamsexm01a.eu.qualcomm.com>
Date: Wed, 14 Sep 2016 14:24:39 +0200
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
To: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, rmanohar@codeaurora.org

Rajkumar Manoharan <rmanohar@qti.qualcomm.com> wrote:
> Currently testmode events for 10.x firmware are processed from
> 10.1 wmi event processing. In order to remove 10.1 firmware support,
> testmode events should be handled from 10.2 event processing.
> 
> Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>

This is an old patch, but we already have this functionality in
ath10k_wmi_10_2_op_rx(). So I'll drop this patch.

-- 
Sent by pwcli
https://patchwork.kernel.org/patch/9153395/


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
