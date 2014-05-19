Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-la0-x234.google.com ([2a00:1450:4010:c03::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WmL1x-0005tG-Uu
 for ath10k@lists.infradead.org; Mon, 19 May 2014 10:42:54 +0000
Received: by mail-la0-f52.google.com with SMTP id gl10so3903186lab.39
 for <ath10k@lists.infradead.org>; Mon, 19 May 2014 03:42:25 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <EE97821C81277E459BEA5C6384C6F241012F109978DB@srvexch01.SODIELEC.local>
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
 <CALhHN=p5+ukpX-45z-k8sZ9_TJ+0Fw0da+65n7zzT8jKSFdXWQ@mail.gmail.com>
 <EE97821C81277E459BEA5C6384C6F241012F109978D9@srvexch01.SODIELEC.local>
 <CALhHN=pjXipq2e7v-=BKHj8xJa8riHCLwXX1jTQjAZQ0PFx5MQ@mail.gmail.com>
 <EE97821C81277E459BEA5C6384C6F241012F109978DB@srvexch01.SODIELEC.local>
Date: Mon, 19 May 2014 12:42:25 +0200
Message-ID: <CALhHN=rH0Qt2Y3xpdkuXqG6mO3uzu2RZnZg6tFd54Q_JZ7aUZg@mail.gmail.com>
Subject: Re: RE : RE ath10k: set channel by command "iw" not from hostapd and
 DFS support of firmware-2.bin_10.1.467.2-1
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

On 19 May 2014 11:39, Vu Hai NGUYEN <vh.nguyen@actiasodielec.fr> wrote:
>>> ath10k: failed to initialise DFS pattern detector
>>> cfg80211: Calling CRDA for country: FR
>>> cfg80211: Regulatory domain changed to country: FR
>>> cfg80211:  DFS Master region: ETSI
>>> cfg80211:   (start_freq - end_freq @ bandwidth), (max_antenna_gain, max_eirp), (
>>> dfs_cac_time)
>>> cfg80211:   (2402000 KHz - 2482000 KHz @ 40000 KHz), (N/A, 2000 mBm), (N/A)
>>> cfg80211:   (5170000 KHz - 5250000 KHz @ 80000 KHz), (N/A, 2000 mBm), (N/A)
>>> cfg80211:   (5250000 KHz - 5330000 KHz @ 80000 KHz), (N/A, 2000 mBm), (0 s)
>>>cfg80211:   (5490000 KHz - 5710000 KHz @ 80000 KHz), (N/A, 2700 mBm), (0 s)
>>> cfg80211:   (57240000 KHz - 65880000 KHz @ 2160000 KHz), (N/A, 4000 mBm), (N/A)
>
>>Yes, ath.ko is compiled without CERTIFICATION_ONUS flag;
>>(probably file compiled but always return NULL during pattern detector init).
>
> Thanks, my mistake cause I replace the folder ath in backports with the one from master branch and I didn't change all of CONFIG_... to CPTCFG, now I got:
>
> ath: country maps to regdmn code: 0x37
> ath: Country alpha2 being used: FR
> ath: Regpair used: 0x37
> ath10k: dfs region 0x0
> cfg80211: Calling CRDA for country: FR
> ath10k: dfs region 0x2
> cfg80211: Regulatory domain changed to country: FR
> cfg80211:  DFS Master region: ETSI
> cfg80211:   (start_freq - end_freq @ bandwidth), (max_antenna_gain, max_eirp), )
> cfg80211:   (2402000 KHz - 2482000 KHz @ 40000 KHz), (N/A, 2000 mBm), (N/A)
> cfg80211:   (5170000 KHz - 5250000 KHz @ 80000 KHz), (N/A, 2000 mBm), (N/A)
> cfg80211:   (5250000 KHz - 5330000 KHz @ 80000 KHz), (N/A, 2000 mBm), (0 s)
> cfg80211:   (5490000 KHz - 5710000 KHz @ 80000 KHz), (N/A, 2700 mBm), (0 s)
> cfg80211:   (57240000 KHz - 65880000 KHz @ 2160000 KHz), (N/A, 4000 mBm), (N/A)
>
> And another different backtrace than before:
>
> ------------[ cut here ]------------
> WARNING: at /home/alberix2/Desktop/Wilinks_ath10k/ACCESS_POINT_APPLI/Source/Dri)
> Modules linked in: ath10k_pci(O) ath10k_core(O) ath(O) mac80211(O) cfg80211(O) ]
> Backtrace:
> [<c0011938>] (dump_backtrace+0x0/0x118) from [<c050205c>] (dump_stack+0x18/0x20)
>  r6:bf209143 r5:000016c0 r4:00000000 r3:c10bc7ac
> [<c0502044>] (dump_stack+0x0/0x20) from [<c0066c38>] (warn_slowpath_common+0x54)
> [<c0066be4>] (warn_slowpath_common+0x0/0x70) from [<c0066c78>] (warn_slowpath_n)
>  r8:00000000 r7:00000000 r6:d2ef3000 r5:d27fc000 r4:d2ef33c8
> r3:00000009
> [<c0066c54>] (warn_slowpath_null+0x0/0x2c) from [<bf1ccadc>] (nl80211_start_rad)
> [<bf1cc9e4>] (nl80211_start_radar_detection+0x0/0x16c [cfg80211]) from [<c04534)
> [<c04532d4>] (genl_rcv_msg+0x0/0x1f4) from [<c0452904>] (netlink_rcv_skb+0x58/0)
> [<c04528ac>] (netlink_rcv_skb+0x0/0xb8) from [<c04532c4>] (genl_rcv+0x20/0x30)
>  r6:c09a2400 r5:d2a52ca0 r4:d2a52ca0 r3:c04532a4
> [<c04532a4>] (genl_rcv+0x0/0x30) from [<c04522d0>] (netlink_unicast+0x224/0x2c4)
>  r4:d0074400 r3:c04532a4
> [<c04520ac>] (netlink_unicast+0x0/0x2c4) from [<c04526a4>] (netlink_sendmsg+0x2)
> [<c0452414>] (netlink_sendmsg+0x0/0x320) from [<c0428eac>] (sock_sendmsg+0x98/0)
> [<c0428e14>] (sock_sendmsg+0x0/0xb4) from [<c0429150>] (__sys_sendmsg+0x1d0/0x2)
>  r4:d2887f64
> [<c0428f80>] (__sys_sendmsg+0x0/0x26c) from [<c042ab30>] (sys_sendmsg+0x44/0x68)
> [<c042aaec>] (sys_sendmsg+0x0/0x68) from [<c000ddc0>] (ret_fast_syscall+0x0/0x3)
>  r6:00134870 r5:4010d9f0 r4:00136660
> ---[ end trace 3dff84bb4058c392 ]---
>
> My station can see the wifi from ap but it can not connected to it yet. Could the backtrace
> say anything about my problem?
>
What file and line there is? Seems you cut the Warning message? If
CAC=0 then this is not a problem.

BTW, I am not sure this will work correctly if you will get "some"
backport and exchange only ath10k sources.
cfg80211/mac80211 could be incompatible with driver in such case.
Michal suggest to generate own backport form ath10k.git - this for
sure will work fine. In any other cases, while you will mix sources,
will be very hard to track your problems.

BR
Janusz

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
