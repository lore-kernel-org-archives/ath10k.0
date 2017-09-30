Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf0-x235.google.com ([2a00:1450:4010:c07::235])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dyDJ7-0002dE-GU
 for ath10k@lists.infradead.org; Sat, 30 Sep 2017 08:39:35 +0000
Received: by mail-lf0-x235.google.com with SMTP id y187so1643429lfc.8
 for <ath10k@lists.infradead.org>; Sat, 30 Sep 2017 01:39:12 -0700 (PDT)
Received: from [176.195.177.2] ([176.195.177.2])
 by smtp.googlemail.com with ESMTPSA id f196sm793240lff.83.2017.09.30.01.39.09
 for <ath10k@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 30 Sep 2017 01:39:09 -0700 (PDT)
From: svp <s.pooheer@gmail.com>
Subject: QCA988x and kernel 4.13
Message-ID: <c6294832-ff1e-595c-da8b-dac59b12a976@gmail.com>
Date: Sat, 30 Sep 2017 11:39:08 +0300
MIME-Version: 1.0
Content-Language: ru-RU
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
To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Hi!

After upgrade to 4.13 have errors in log

kernel: INFO: task kworker/u8:5:113 blocked for more than 120 seconds.
kernel:       Tainted: G           O    4.13.3-1-ARCH #1
kernel: "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this essage.
kernel: kworker/u8:5    D    0   113      2 0x00000000
kernel: Workqueue: phy0 ieee80211_ba_session_work [mac80211]
kernel: Call Trace:
kernel:  __schedule+0x239/0x890
kernel:  schedule+0x3d/0x90
kernel:  schedule_preempt_disabled+0x15/0x20
kernel:  __mutex_lock.isra.2+0x295/0x520
kernel:  ? ttwu_do_wakeup+0x1e/0x160
kernel:  __mutex_lock_slowpath+0x13/0x20
kernel:  ? update_load_avg+0x426/0x5a0
kernel:  ? __mutex_lock_slowpath+0x13/0x20
kernel:  mutex_lock+0x25/0x30
kernel:  __ieee80211_start_rx_ba_session+0x153/0x520 [mac80211]
kernel:  ieee80211_ba_session_work+0x164/0x250 [mac80211]
kernel:  process_one_work+0x1de/0x430
kernel:  worker_thread+0x47/0x3f0
kernel:  kthread+0x125/0x140
kernel:  ? process_one_work+0x430/0x430
kernel:  ? kthread_create_on_node+0x70/0x70
kernel:  ret_from_fork+0x25/0x30

Then this system became unstable.

lspci
06:00.0 Network controller: Qualcomm Atheros QCA986x/988x 802.11ac Wireless 
Network Adapter

uname -a
Linux I5-4670 4.13.3-1-ARCH #1 SMP PREEMPT Thu Sep 21 20:33:16 CEST 2017 x86_64 
GNU/Linux

iwconfig
wlp6s0    IEEE 802.11  Mode:Master  Tx-Power=30 dBm
           Retry short limit:7   RTS thr:off   Fragment thr:off
           Power Management:on

firmware-5.bin_10.2.4.70.59-2 was used

Thanks!




_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
