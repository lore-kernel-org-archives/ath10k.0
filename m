Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mout.gmx.net ([212.227.17.20])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ync0M-0006sq-SO
 for ath10k@lists.infradead.org; Thu, 30 Apr 2015 00:07:03 +0000
Received: from [192.168.69.6] ([79.6.218.1]) by mail.gmx.com (mrgmx103) with
 ESMTPSA (Nemesis) id 0M0yaB-1Z8ro23sbP-00v44t for
 <ath10k@lists.infradead.org>; Thu, 30 Apr 2015 02:06:38 +0200
Message-ID: <5541722A.2060109@gmx.com>
Date: Thu, 30 Apr 2015 02:07:06 +0200
From: Gabriele Martino <g.martino@gmx.com>
MIME-Version: 1.0
Subject: Re: QCA6174 hw2.1?
References: <trinity-d51578c9-4e28-4805-b58e-fdd5388949da-1426217948333@msvc-mesg-gmx002>
 <CA+BoTQnGQC9sy_Qhiv4peeRsF2dY+2yd12GTgJpyRhrgMTg+Yw@mail.gmail.com>
 <trinity-2097dd2e-b8b3-40c5-9eed-c0dc7d8690af-1426260485155@3capp-mailcom-lxa11>
 <CA+BoTQnKJE0w0SZrh-p2KaKe62t4=cRLnjeKu+t9aeE+LFce-w@mail.gmail.com>
 <loom.20150425T025815-684@post.gmane.org>
 <CAJAVYN208PQpnt5oQPi1hdYW71WMVJReBNSY-OqZ9aCb0yuiaA@mail.gmail.com>
 <553B8F89.4040908@gmx.com>
 <CAJAVYN1XKYdGqx4pzg3C9kSxj6_qwr4raoDJm7e+VLy1P=dsdw@mail.gmail.com>
 <553CF1EE.50807@gmx.com> <553D8112.2050300@gmx.com>
 <CA+-y_t-L5tAYRfT5+WzbB_EvZbWDO3hys9GD8Ms7fFhT_9cy_Q@mail.gmail.com>
 <553E5011.2050404@gmx.com>
 <CAJAVYN2WGEwrajUKFOpYPC7YWnovSs3pmQfjmP74hfwW-epJ2Q@mail.gmail.com>
 <CA+-y_t8pm+GPEaKX6cYta-Q4kiAd6mFKLO37nmS6pwPV63_VyA@mail.gmail.com>
In-Reply-To: <CA+-y_t8pm+GPEaKX6cYta-Q4kiAd6mFKLO37nmS6pwPV63_VyA@mail.gmail.com>
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
To: ath10k@lists.infradead.org

On 28/04/2015 13:55, Moritz Morawietz wrote:
> Many thanks for your fast help!
>
> I've made some progress, but ran into other problems.
> If i compile ath10_pci, ath10k_core and ath from kvalo's tree and load
> them, i get following dmesg output:
>
> [    2.980448] ath10k_pci 0000:06:00.0: enabling device (0000 -> 0002)
> [    2.980750] ath10k_pci 0000:06:00.0: pci irq msi-x interrupts 8
> irq_mode 0 reset_mode 0
> [    3.158860] ath10k_pci 0000:06:00.0: Direct firmware load for
> ath10k/cal-pci-0000:06:00.0.bin failed with error -2
> [    3.159611] ath10k_pci 0000:06:00.0: Direct firmware load for
> ath10k/QCA6174/hw2.1/board-pci-168c:003e:1a56:1525.bin failed with
> error -2
> [    3.159613] ath10k_pci 0000:06:00.0: failed to load spec board
> file, falling back to generic: -2
> [    3.159922] ath10k_pci 0000:06:00.0: Direct firmware load for
> ath10k/QCA6174/hw2.1/firmware-5.bin failed with error -2
> [    3.159924] ath10k_pci 0000:06:00.0: could not fetch firmware file
> 'ath10k/QCA6174/hw2.1/firmware-5.bin': -2
> [    4.360946] ath10k_pci 0000:06:00.0: qca6174 hw2.1 (0x05010000,
> 0x003405ff, 168c:003e:1a56:1525 fallback) fw killer-n1525-fw api 4 htt
> 3.1 wmi 4 cal otp max_sta 32
> [    4.360950] ath10k_pci 0000:06:00.0: debug 1 debugfs 1 tracing 1
> dfs 0 testmode 0
> [    4.430068] ath: EEPROM regdomain: 0x6c
> [    4.430070] ath: EEPROM indicates we should expect a direct regpair map
> [    4.430072] ath: Country alpha2 being used: 00
> [    4.430072] ath: Regpair used: 0x6c
> [    4.430078] ath10k_pci 0000:06:00.0: failed to register ieee80211: -22
> [    4.430097] ath10k_pci 0000:06:00.0: could not register to mac80211 (-22)
>
> So I compiled mac80211, and tried to load it. What i get is a load of
> that messages:
>
> [  226.812494] mac80211: Unknown symbol cfg80211_cqm_rssi_notify (err -22)
> [  226.812497] mac80211: disagrees about version of symbol cfg80211_auth_timeout
> [  226.812497] mac80211: Unknown symbol cfg80211_auth_timeout (err -22)
> [  226.812498] mac80211: disagrees about version of symbol
> cfg80211_rx_unprot_mlme_mgmt
> [  226.812499] mac80211: Unknown symbol cfg80211_rx_unprot_mlme_mgmt (err -22)
>
> Because mac80211 depends on cfg80211, i compilied and tested it. The
> error messages reduced to
>
> [  632.208849] mac80211: Unknown symbol rhashtable_insert_rehash (err 0)
> [  632.208881] mac80211: Unknown symbol rhashtable_insert_slow (err 0)
>
> Know I'm stuck. I'll try to compile and use the whole kernel (it's
> compiling right now), but would prefer to just change the modules.
I could find some references to "rhashtable_insert_rehash" with grep:
/usr/src/linux/lib/rhashtable.c:int rhashtable_insert_rehash(struct
rhashtable *ht)
/usr/src/linux/lib/rhashtable.c:EXPORT_SYMBOL_GPL(rhashtable_insert_rehash);

This file is present in 3.18.11 kernel (I don't have older sources on
this laptop).
Which distribution and kernel are you using?
You are compiling 4.0 (-> 3.20) modules, so you're likely to get strange
issues if your kernel is too old.

Regards,
Gabriele


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
