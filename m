Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VPXBz-0001Uf-VS
 for ath10k@lists.infradead.org; Fri, 27 Sep 2013 12:30:44 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v3 00/13] ath10k: dual-firmware support (MAIN and 10.X)
References: <1380210437-4391-1-git-send-email-bartosz.markowski@tieto.com>
Date: Fri, 27 Sep 2013 15:30:11 +0300
In-Reply-To: <1380210437-4391-1-git-send-email-bartosz.markowski@tieto.com>
 (Bartosz Markowski's message of "Thu, 26 Sep 2013 17:47:04 +0200")
Message-ID: <87had6la5o.fsf@kamboji.qca.qualcomm.com>
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
> Changes in v2:
> (review comments from Kalle and Michal):
> * WMI cmd, pdev and vdev params names trimmed
> * ath10k_wmi_cmd_init() exposed only
> * few 'if' statements simplifications
> * 10.x mgmt frames over WMI - 'BUG: scheduling while atomic' fixed
>
> Changes in v3:
> * print cmd_id when warning about unsupported WMI command
> * remove excessive empty line
>
> Bartosz Markowski (13):
>   ath10k: introduce dynamic WMI structures
>   ath10k: add wmi_10x_<cmd/event> definitions
>   ath10k: warn if give WMI command is not supported
>   ath10k: implement WMI events handling frame for both firmwares
>   ath10k: split ath10k_wmi_service_ready_event_rx
>   ath10k: drop the fw versioning sanity check
>   ath10k: implement host memory chunks
>   ath10k: bring back the WMI path for mgmt frames
>   ath10k: split wmi_cmd_init path
>   ath10k: add TARGET values for 10.x firmware
>   ath10k: introduce dynamic vdev parameters
>   ath10k: introduce dynamic pdev parameters
>   ath10k: handle FW API differences for scan structures

Thanks, all 13 applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
