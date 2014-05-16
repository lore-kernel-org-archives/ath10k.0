Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-la0-x233.google.com ([2a00:1450:4010:c03::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WlGfG-0001fw-Fx
 for ath10k@lists.infradead.org; Fri, 16 May 2014 11:51:03 +0000
Received: by mail-la0-f51.google.com with SMTP id gf5so1828963lab.24
 for <ath10k@lists.infradead.org>; Fri, 16 May 2014 04:50:37 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CALhHN=pVa0szvpx2Zvq0XcGyCMEVgUSAjcM5GQGdB_UfQmCggw@mail.gmail.com>
References: <EE97821C81277E459BEA5C6384C6F241012F0EFBBCBD@srvexch01.SODIELEC.local>
 <5373382C.1030709@elisanet.fi>
 <EE97821C81277E459BEA5C6384C6F241012F109978C9@srvexch01.SODIELEC.local>
 <DUB122-W4070B8F41A0F8A25061141CB360@phx.gbl>
 <EE97821C81277E459BEA5C6384C6F241012F109978CE@srvexch01.SODIELEC.local>
 <CALhHN=pGozL43B+qiJ20it3QCkvKkOL_RynfvUod_Ert8v1+3Q@mail.gmail.com>
 <EE97821C81277E459BEA5C6384C6F241012F109978CF@srvexch01.SODIELEC.local>
 <EE97821C81277E459BEA5C6384C6F241012F109978D1@srvexch01.SODIELEC.local>
 <CALhHN=q_kuaszuBdsWHLZJYEA1PW63AqDFiF89DC3c4pOJseOg@mail.gmail.com>
 <EE97821C81277E459BEA5C6384C6F241012F109978D3@srvexch01.SODIELEC.local>
 <CALhHN=pYKwhCRy8RZWFm=5mssrL=oqTsazWfkVaN2L8O6YNO3w@mail.gmail.com>
 <CACKGw+ECRrMxk4Q4Rk_PMm0WDqnyK5x9YdKSPYus_zMHxvi17Q@mail.gmail.com>
 <EE97821C81277E459BEA5C6384C6F241012F109978D4@srvexch01.SODIELEC.local>
 <CACKGw+FA-oprMTqg1fVxce86Gq1mghMhE+Y20=EYic3PcS1mSQ@mail.gmail.com>
 <EE97821C81277E459BEA5C6384C6F241012F109978D7@srvexch01.SODIELEC.local>
 <CALhHN=pVa0szvpx2Zvq0XcGyCMEVgUSAjcM5GQGdB_UfQmCggw@mail.gmail.com>
Date: Fri, 16 May 2014 13:50:37 +0200
Message-ID: <CALhHN=p5+ukpX-45z-k8sZ9_TJ+0Fw0da+65n7zzT8jKSFdXWQ@mail.gmail.com>
Subject: Re: RE : RE : RE : RE : RE : RE : ath10k: set channel by command "iw"
 not from hostapd and DFS support of firmware-2.bin_10.1.467.2-1
From: Janusz Dziedzic <janusz.dziedzic@tieto.com>
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
To: Vu Hai NGUYEN <vh.nguyen@actiasodielec.fr>
Cc: Patrick CARNEIRO RODRIGUEZ <p.carneiro@actiasodielec.fr>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Bartosz Markowski <bartosz.markowski@tieto.com>

On 16 May 2014 13:39, Janusz Dziedzic <janusz.dziedzic@tieto.com> wrote:
> On 16 May 2014 11:41, Vu Hai NGUYEN <vh.nguyen@actiasodielec.fr> wrote:
>>>> Yes I'm using backport v3.15 (latest) to build ath10k for my kernel 3.2.36 (provided by Marvell for my Marvell Armada 370 chipset).
>>>> I also download the folder ath from ath10k master branch (I got problem with seeing information of fw_stats from the version ath10k in backport).
>>>> Any suggestion? Please feel free to ask me more information if you need :D
>>
>>>Did you just replace it under your backports folder? Maybe you still
>>>have CONFIG_ATH10K_DFS_CERTIFIED instead of
>>>CPTCFG_ATH10K_DFS_CERTIFIED there?
>>
>> Oh yes thank you, I did it for other define (DEBUG, DEBUGFS, ..)  and CONFIG_ATH10K_DFS_CERTIFIED in the file debug.c (that's why I had 3 debug files of DFS) but I did not do it in 2 files wmi.c and mac.c
>> Now I don't get the error like before but this warning appear:
>>
>> ath10k: wmi mgmt vdev up id 0x1 assoc id 0 bssid 04:f0:21:0e:38:be
>> ath10k: mac monitor vdev 1 started
>> ath10k: mac monitor started
>> ------------[ cut here ]------------
>> WARNING: at /home/alberix2/Desktop/Wilinks_ath10k/ACCESS_POINT_APPLI/Source/Driv
>> er_ath10k/backports-3.15-rc1-1/net/wireless/nl80211.c:5824 nl80211_start_radar_d
>> etection+0xf8/0x16c [cfg80211]()
>> Modules linked in: ath10k_pci(O) ath10k_core(O) ath(O) mac80211(O) cfg80211(O) c
>> ompat(O) arc4 ubifs ubi [last unloaded: compat]
>> Backtrace:
>> [<c0011938>] (dump_backtrace+0x0/0x118) from [<c050205c>] (dump_stack+0x18/0x20)
>>  r6:bf64b61f r5:000016c0 r4:00000000 r3:c10bc7ac
>> [<c0502044>] (dump_stack+0x0/0x20) from [<c0066c38>] (warn_slowpath_common+0x54/
>> 0x70)
>> [<c0066be4>] (warn_slowpath_common+0x0/0x70) from [<c0066c78>] (warn_slowpath_nu
>> ll+0x24/0x2c)
>>  r8:00000000 r7:00000000 r6:d2e88000 r5:d27a8000 r4:d2e883c8
>> r3:00000009
>> [<c0066c54>] (warn_slowpath_null+0x0/0x2c) from [<bf60fadc>] (nl80211_start_rada
>> r_detection+0xf8/0x16c [cfg80211])
>> [<bf60f9e4>] (nl80211_start_radar_detection+0x0/0x16c [cfg80211]) from [<c045348
>> 8>] (genl_rcv_msg+0x1b4/0x1f4)
>> [<c04532d4>] (genl_rcv_msg+0x0/0x1f4) from [<c0452904>] (netlink_rcv_skb+0x58/0x
>> b8)
>> [<c04528ac>] (netlink_rcv_skb+0x0/0xb8) from [<c04532c4>] (genl_rcv+0x20/0x30)
>>  r6:d318fe00 r5:d29afb00 r4:d29afb00 r3:c04532a4
>> [<c04532a4>] (genl_rcv+0x0/0x30) from [<c04522d0>] (netlink_unicast+0x224/0x2c4)
>>  r4:d0074400 r3:c04532a4
>> [<c04520ac>] (netlink_unicast+0x0/0x2c4) from [<c04526a4>] (netlink_sendmsg+0x29
>> 0/0x320)
>> [<c0452414>] (netlink_sendmsg+0x0/0x320) from [<c0428eac>] (sock_sendmsg+0x98/0x
>> b4)
>> [<c0428e14>] (sock_sendmsg+0x0/0xb4) from [<c0429150>] (__sys_sendmsg+0x1d0/0x26
>> c)
>>  r4:d2b9bf64
>> [<c0428f80>] (__sys_sendmsg+0x0/0x26c) from [<c042ab30>] (sys_sendmsg+0x44/0x68)
>> [<c042aaec>] (sys_sendmsg+0x0/0x68) from [<c000ddc0>] (ret_fast_syscall+0x0/0x30
>> )
>>  r6:00134870 r5:4008f9f0 r4:00136660
>> ---[ end trace 4c6338919fa0b3d6 ]---
> Warning is about cac_time = 0 - this is not a problem at all.
>
>>
>> My iw dev show : channel 52 (5260 MHz), width: 20 MHz, center1: 5260 MHz  but I can not connect my station to the access point (seems it does not work yet cause the file "dfs_stats" still show "DFS not enabled" . I had a debug msg with debug mask = 0x432 for ath10k in the attached file if someone are interested in.
>>
> After cac_time you should see beacons in airlogs. Does you station see
> this AP in scan results? Does your station support this channel (iw
> list on sta side)?

BTW "DFS not enabled" means DFS region you have in regdb is not
supported by patter detector. Probably you don't have DFS region at
all? Add to debug mask ATH10K_DBG_REGULATORY,

> BR
> Janusz

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
