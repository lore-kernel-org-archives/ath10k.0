Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VLcEx-0003Mn-4q
 for ath10k@lists.infradead.org; Mon, 16 Sep 2013 17:05:36 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCHv2 0/7] ath10k: improve TX path
References: <1378821003-22925-1-git-send-email-michal.kazior@tieto.com>
 <1379074618-30534-1-git-send-email-michal.kazior@tieto.com>
Date: Mon, 16 Sep 2013 20:05:11 +0300
In-Reply-To: <1379074618-30534-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Fri, 13 Sep 2013 14:16:51 +0200")
Message-ID: <871u4on1dk.fsf@qca.qualcomm.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Michal Kazior <michal.kazior@tieto.com> writes:

> Hi,
>
> This patchset addresses two issues:
>
>  * system/userspace starvation on heavy briding
>    UDP TX
>  * unstable/inconsistent UDP TX throughput
>
> In short the patchset simplifies TX path by
> removing HTC TX workers, makes WMI commands block
> and makes ath10k more responsive to queues
> becoming full. This contributes to both improved
> throughput and makes the system more responsive
> under heavy UDP TX load.
>
> Max stable briding TX (ath10k as TX):
>  UDP w/o patchset: 520mbps
>  UDP w/  patchset: 570mbps
>
>  TCP w/o patchset: 350mbps
>  TCP w/  patchset: 400mbps
>
> Measured with two 2x2 cards, one acting as an AP
> on AP135 board, the other as a STA on a core i5
> laptop. The AP135 was passing traffic from a
> station on LAN/eth1 to the STA/wlan0.
>
> v2:
>  * use DIV_ROUND_UP
>  * comment usage of ath10k_wmi_tx_beacons_nowait
>  * additional check for tx_credits_flow_enabled
>
>
> Michal Kazior (7):
>   ath10k: simplify HTC credits calculation
>   ath10k: add HTC TX credits replenishing notification
>   ath10k: make WMI commands block by design
>   ath10k: simplify HTC command submitting
>   ath10k: improve beacon submission latency
>   ath10k: remove wmi pending count limit
>   ath10k: remove wmi event worker thread

Thanks, applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
