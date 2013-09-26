Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VPBGp-0006WC-Uh
 for ath10k@lists.infradead.org; Thu, 26 Sep 2013 13:06:16 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 00/13] ath10k: dual-firmware support (MAIN and 10.X)
References: <1380187792-25626-1-git-send-email-bartosz.markowski@tieto.com>
Date: Thu, 26 Sep 2013 16:05:41 +0300
In-Reply-To: <1380187792-25626-1-git-send-email-bartosz.markowski@tieto.com>
 (Bartosz Markowski's message of "Thu, 26 Sep 2013 11:29:39 +0200")
Message-ID: <87y56jpwbe.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
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
To: Bartosz Markowski <bartosz.markowski@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Bartosz Markowski <bartosz.markowski@tieto.com> writes:

> This patch-set adds framework for dynamic support of 10.X FW branch.
>
> The major changes covered by this work:
> * dynamic WMI structures
> * WMI cmd/event definitions from 10.x FW track
> * memory host chunks feature
> * management frames path over WMI for 10.x
> * WMI RX events handling for MAIN and 10.X split
> * target config split (LARGE AP feature for 10.x)
> * scan start sctructure split
> * dynamic VDEV and PDEV parameters structures
>
> Changes in v2 
> (review comments from Kalle and Michal):
> * WMI cmd, pdev and vdev params names trimmed
> * ath10k_wmi_cmd_init() exposed only
> * few 'if' statements simplifications
> * 10.x mgmt frames over WMI - 'BUG: scheduling while atomic' fixed

This is looking very good now, I had only had few nitpicks which I found
while reviewing this.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
