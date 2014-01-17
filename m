Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-bk0-x22b.google.com ([2a00:1450:4008:c01::22b])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W49DC-00005F-Nm
 for ath10k@lists.infradead.org; Fri, 17 Jan 2014 13:11:51 +0000
Received: by mail-bk0-f43.google.com with SMTP id mx11so118236bkb.2
 for <ath10k@lists.infradead.org>; Fri, 17 Jan 2014 05:11:27 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <87txd2re1z.fsf@kamboji.qca.qualcomm.com>
References: <1389345564-21042-1-git-send-email-yeohchunyeow@gmail.com>
 <87txd2re1z.fsf@kamboji.qca.qualcomm.com>
Date: Fri, 17 Jan 2014 21:11:24 +0800
Message-ID: <CAEFj987bofbcHJh2=pvxujxZgLwFjgV+1UeLC5kfKZYqiQHyyg@mail.gmail.com>
Subject: Re: [PATCH v2] ath10k: fix the MAC address of peer statistic
From: Yeoh Chun-Yeow <yeohchunyeow@gmail.com>
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
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, ath10k@lists.infradead.org

> Any ideas what's happening here?

My one is MIPS32 (Compex WPJ344) and the following PEER stats are
printed correctly:

# cat /sys/kernel/debug/ieee80211/phy0/ath10k/fw_stats

   MPDU errors (FCS, MIC, ENC)          0

             ath10k PEER stats
             =================

              Peer MAC address 04:f0:21:0c:a5:44
                     Peer RSSI 68
                  Peer TX rate 0

Could this be the Endianness problem? How about if you remain the
struct wmi_peer_stats? Also, just to point out the TxRate is not
working (always 0).


>> +     /* The first peer is self MAC address, ignore this */
>> +     num_peer_stats--;
>> +     tmp += sizeof(struct wmi_peer_stats);
>
> Should we show "self peer" separately? Does it provide any useful
> information?

So far, we only have RSSI and Tx Rate. Both are not really useful for
"self peer".

----
Chun-Yeow

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
