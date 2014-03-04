Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ve0-x232.google.com ([2607:f8b0:400c:c01::232])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WKm0x-0005d9-6V
 for ath10k@lists.infradead.org; Tue, 04 Mar 2014 09:51:55 +0000
Received: by mail-ve0-f178.google.com with SMTP id jw12so2657072veb.37
 for <ath10k@lists.infradead.org>; Tue, 04 Mar 2014 01:51:34 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CA+BoTQ=Q86r4E-CaHCmmxrkQJcHH_ZeaB2-e534KOQvSOgMcjA@mail.gmail.com>
References: <CAEFj9874KjsRfC1rK5X1wWpQ-1hCt44tOLj5q+adWWLUbuyE0g@mail.gmail.com>
 <CA+BoTQnS1veOHepWtAsM2HfdKAAgtAoHganHHKo1VyBEowyJ6A@mail.gmail.com>
 <CAEFj986yq_K3iu6K8mzvfPjYmuULEZEPuRDOua2iLFTRimkuFA@mail.gmail.com>
 <CALhHN=p+dyQsnbc4+sDjqoHysnak4Uq3KYEkyCT-BDXvHPszCw@mail.gmail.com>
 <CAEFj984xXPrLQu+pjt6jSyuYT-hn3uM8fLj1UmhhJfF7K_=taA@mail.gmail.com>
 <CA+BoTQ=Q86r4E-CaHCmmxrkQJcHH_ZeaB2-e534KOQvSOgMcjA@mail.gmail.com>
Date: Tue, 4 Mar 2014 17:51:33 +0800
Message-ID: <CAEFj9844cE+XcS4zTVD8hf4eVrk_v=8xisc7vUBzwsnzm-ARwg@mail.gmail.com>
Subject: Re: Only Lowest Legacy Rate 6Mbps used by Adhoc Mode
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: Janusz Dziedzic <janusz.dziedzic@tieto.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

> Hmm.. if I assume ath10k_sta_state() isn't called for AUTH->ASSOC
> (which probably isn't unreasonable to consider since IBSS doesn't have
> an association sequence, does it?) then ath10k_station_assoc() isn't
> called and neither is ath10k_wmi_peer_assoc() which I suspect setups
> HW rate control.

Nope, the mac80211 will move the STA state to AUTH and ASSOC when the
STA is added but as legacy STA. So ath10k_station_assoc is called as
shown below:

[  445.080000] ath10k: mac vdev 0 peer create 04:f0:21:0c:a5:44 (new
sta) num_peers 2
[  445.080000] ath10k: wmi peer create vdev_id 0 peer_addr 04:f0:21:0c:a5:44
[  445.080000] ath10k: mac sta 04:f0:21:0c:a5:44 associated
[  445.080000] ath10k: mac peer 04:f0:21:0c:a5:44 phymode 11a
--------> [first association with legacy]
[  445.080000] ath10k: wmi peer assoc vdev 0 addr 04:f0:21:0c:a5:44
[  445.160000] ath10k: mac sta rc update for 04:f0:21:0c:a5:44 changed
00000004 bw 0 nss 1 smps 2
[  445.160000] ath10k: mac sta rc update for 04:f0:21:0c:a5:44:
changing supported rates not implemented [upgrade the rate]
[  445.170000] ath10k: wmi peer delete vdev_id 0 peer_addr
04:f0:21:0c:a5:44 -----------> [delete peer]
[  445.170000] ath10k: wmi peer create vdev_id 0 peer_addr
04:f0:21:0c:a5:44 -----------> [create peer]
[  445.170000] ath10k: mac ht peer 04:f0:21:0c:a5:44 mcs cnt 24 nss 1
[  445.170000] ath10k: mac peer 04:f0:21:0c:a5:44 phymode 11na-ht20
[  445.170000] ath10k: wmi peer assoc vdev 0 addr 04:f0:21:0c:a5:44
------------> [associate peer again with HT]
[  445.170000] ath10k: wmi vdev 0 peer 0x04:f0:21:0c:a5:44 set param 1 value 1

My further investigation shows that the rate control is working when
you added and associated the STA at first.

Later on, mac80211 found out that the adhoc node can support HT or VHT
and try to call drv_sta_rc_update. But since the
IEEE80211_RC_SUPP_RATES_CHANGED is not implemented, I try to add the
code to disassoc -> delete -> create -> assoc the STA again. But the
rate control is no longer working (but you can fix the HT rate as
suggested by Janusz Dziedzic). So what went wrong?

----
Chun-Yeow

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
