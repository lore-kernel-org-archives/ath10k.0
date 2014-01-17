Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W49fa-0000ma-1o
 for ath10k@lists.infradead.org; Fri, 17 Jan 2014 13:41:10 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2] ath10k: fix the MAC address of peer statistic
References: <1389345564-21042-1-git-send-email-yeohchunyeow@gmail.com>
 <CA+BoTQmexjQy-+Bv-uofBa2Ndcu56yYOAEeNzdBSE3yMCQdZKw@mail.gmail.com>
Date: Fri, 17 Jan 2014 15:40:41 +0200
In-Reply-To: <CA+BoTQmexjQy-+Bv-uofBa2Ndcu56yYOAEeNzdBSE3yMCQdZKw@mail.gmail.com>
 (Michal Kazior's message of "Fri, 17 Jan 2014 14:38:00 +0100")
Message-ID: <87d2jqrajq.fsf@kamboji.qca.qualcomm.com>
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
Cc: Chun-Yeow Yeoh <yeohchunyeow@gmail.com>, linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Michal Kazior <michal.kazior@tieto.com> writes:

> On 10 January 2014 10:19, Chun-Yeow Yeoh <yeohchunyeow@gmail.com> wrote:
>
>>  struct wmi_peer_stats {
>> +       __le32 peer_tx_rate;    /* TBA */
>>         struct wmi_mac_addr peer_macaddr;
>>         __le32 peer_rssi;
>> -       __le32 peer_tx_rate;
>>  } __packed;
>
> This looks wrong too. I've just checked it and it seems the
> `wal_dbg_tx_stats` is out of date. It's missing a `__le32
> stateless_tid_alloc_failure` that has been inserted at some point in
> time in the firmware between `pdev_resets` and `phy_underrun`. You
> should add this missing field instead of moving `peer_tx_rate`.
>
> Unfortunately AP firmware has even more fields inserted in
> `wmi_pdev_stats`. Making this work with both firmwares is a mess.

This reminds me that Bartosz sent something related to this few months back:

http://lists.infradead.org/pipermail/ath10k/2013-September/000317.html

I promised to finish it, but it's still in my todo folder :/

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
