Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dz4SK-0000cZ-Jr
 for ath10k@lists.infradead.org; Mon, 02 Oct 2017 17:24:42 +0000
Subject: Re: QCA988x and kernel 4.13
References: <c6294832-ff1e-595c-da8b-dac59b12a976@gmail.com>
 <7549b77b-3619-f8a5-48d6-eb7e330ba80e@dd-wrt.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <48aebea8-9231-b41e-cbaa-d592d8540c53@candelatech.com>
Date: Mon, 2 Oct 2017 10:24:14 -0700
MIME-Version: 1.0
In-Reply-To: <7549b77b-3619-f8a5-48d6-eb7e330ba80e@dd-wrt.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Sebastian Gottschall <s.gottschall@dd-wrt.com>, svp <s.pooheer@gmail.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 10/01/2017 07:06 AM, Sebastian Gottschall wrote:
> you have to update to the latest mac80211 code. there is a well known bug in mac80211 which causes a deadlock with ath10k

Do you have a pointer to the patch that fixes this?  I'd like to check if it has
made it into 4.13 stable yet...

Thanks,
Ben

>
> Am 30.09.2017 um 10:39 schrieb svp:
>> Hi!
>>
>> After upgrade to 4.13 have errors in log
>>
>> kernel: INFO: task kworker/u8:5:113 blocked for more than 120 seconds.
>> kernel:       Tainted: G           O    4.13.3-1-ARCH #1
>> kernel: "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this essage.
>> kernel: kworker/u8:5    D    0   113      2 0x00000000
>> kernel: Workqueue: phy0 ieee80211_ba_session_work [mac80211]
>> kernel: Call Trace:
>> kernel:  __schedule+0x239/0x890
>> kernel:  schedule+0x3d/0x90
>> kernel:  schedule_preempt_disabled+0x15/0x20
>> kernel:  __mutex_lock.isra.2+0x295/0x520
>> kernel:  ? ttwu_do_wakeup+0x1e/0x160
>> kernel:  __mutex_lock_slowpath+0x13/0x20
>> kernel:  ? update_load_avg+0x426/0x5a0
>> kernel:  ? __mutex_lock_slowpath+0x13/0x20
>> kernel:  mutex_lock+0x25/0x30
>> kernel:  __ieee80211_start_rx_ba_session+0x153/0x520 [mac80211]
>> kernel:  ieee80211_ba_session_work+0x164/0x250 [mac80211]
>> kernel:  process_one_work+0x1de/0x430
>> kernel:  worker_thread+0x47/0x3f0
>> kernel:  kthread+0x125/0x140
>> kernel:  ? process_one_work+0x430/0x430
>> kernel:  ? kthread_create_on_node+0x70/0x70
>> kernel:  ret_from_fork+0x25/0x30
>>
>> Then this system became unstable.
>>
>> lspci
>> 06:00.0 Network controller: Qualcomm Atheros QCA986x/988x 802.11ac Wireless Network Adapter
>>
>> uname -a
>> Linux I5-4670 4.13.3-1-ARCH #1 SMP PREEMPT Thu Sep 21 20:33:16 CEST 2017 x86_64 GNU/Linux
>>
>> iwconfig
>> wlp6s0    IEEE 802.11  Mode:Master  Tx-Power=30 dBm
>>           Retry short limit:7   RTS thr:off   Fragment thr:off
>>           Power Management:on
>>
>> firmware-5.bin_10.2.4.70.59-2 was used
>>
>> Thanks!
>>
>>
>>
>>
>> _______________________________________________
>> ath10k mailing list
>> ath10k@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/ath10k
>>
>


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
