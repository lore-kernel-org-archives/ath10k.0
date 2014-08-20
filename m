Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XK7FB-0007Fq-Qg
 for ath10k@lists.infradead.org; Wed, 20 Aug 2014 14:52:10 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: RE : RE : RE : Trouble shooting low rate MCS9 in 802.11ac
References: <30258C2D-7A80-42C1-8AE7-713C490ABF05@st-andrews.ac.uk>
 <CACKGw+HM-VYpotQGcTsanebvfU-4iGocOpbbGak7iUDb7sUURA@mail.gmail.com>
 <EE97821C81277E459BEA5C6384C6F241012F15C1D7EC@srvexch01.SODIELEC.local>
 <CACKGw+HraUvPSVprRQCEh0=MRaiahpGde9wUj-w5pbDtXSj8Yw@mail.gmail.com>
 <EE97821C81277E459BEA5C6384C6F241012F15C1D7EE@srvexch01.SODIELEC.local>
 <CAJ-Vmon+TC_TouvoAX3kZT5x+crrStHLmcjCfOeGHvC5eszbTA@mail.gmail.com>
 <EE97821C81277E459BEA5C6384C6F241012F15C1D7EF@srvexch01.SODIELEC.local>
 <EE97821C81277E459BEA5C6384C6F241012F15C1D7F5@srvexch01.SODIELEC.local>
 <53D252B4.9070704@candelatech.com>
 <EE97821C81277E459BEA5C6384C6F241012F15C1D7F8@srvexch01.SODIELEC.local>
 <53D6757A.8040803@candelatech.com>
 <EE97821C81277E459BEA5C6384C6F241012F15C1D7FE@srvexch01.SODIELEC.local>
 <EE97821C81277E459BEA5C6384C6F241012F15C1D800@srvexch01.SODIELEC.local>
 <CA+BoTQ=QscHgrk5bbWugjdnVGh=T_L-psEPKToYHOdKGcQZi7A@mail.gmail.com>
 <EE97821C81277E459BEA5C6384C6F241014DDDD4DC35@srvexch01.SODIELEC.local>
 <53F396F1.8070906@candelatech.com>
 <EE97821C81277E459BEA5C6384C6F241014DDDD4DC37@srvexch01.SODIELEC.local>
Date: Wed, 20 Aug 2014 17:51:35 +0300
In-Reply-To: <EE97821C81277E459BEA5C6384C6F241014DDDD4DC37@srvexch01.SODIELEC.local>
 (Vu Hai NGUYEN's message of "Wed, 20 Aug 2014 16:13:13 +0200")
Message-ID: <87sikr43k8.fsf@kamboji.qca.qualcomm.com>
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
To: Vu Hai NGUYEN <vh.nguyen@actiasodielec.fr>
Cc: Adrian Chadd <adrian@freebsd.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Michal Kazior <michal.kazior@tieto.com>, Patrick CARNEIRO RODRIGUEZ <p.carneiro@actiasodielec.fr>, Ben Greear <greearb@candelatech.com>, Bartosz Markowski <bartosz.markowski@tieto.com>

Vu Hai NGUYEN <vh.nguyen@actiasodielec.fr> writes:

>>> I'd cleaned all rules of iptables and removed all modules of
>>> iptables from kernel by command modprobe -r But there's still some
>>> process of netfilter process running. I disabled netfilter on
>>> bridge interface by writing 0 to these files:
>>> /proc/sys/net/bridge/bridge-nf-call-arptables
>>> /proc/sys/net/bridge/bridge-nf-call-iptables
>>> /proc/sys/net/bridge/bridge-nf-call-ip6tables
>>> and the performance increases from 500 to 550 Mbps (iperf in tcp
>>> reports between 530 ~ 570Mbps). There is no more process like
>>> "br_nf_pre_routing" and "br_nf_forward_ip". Do you think I can do
>>> anything more to strip down netfilter?
>
>>What do you get for UDP? That seems like pretty good TCP throughput.
>
> In VHT80 mode and rate forced to NSS3:MCS7, I can obtain 750 Mbps with
> less than 1% data lost (in both way, AP to STA and vice versa).
> Normally I can obtain 2/3 theory rate in practical (for expl NSS3:MCS3
> has 390 Mbps in theory, and if I force to that rate, my TCP throughput
> is around 270 Mbps). So I should obtain 650 Mbps in practical for TCP
> with NSS3:MCS7 (975 Mbps in theory). 570 Mbps is so far to 650 Mbps :(

Forcing the data rate isn't really optimal. Have you tried 10.2
firmware? I was told it has improvements in the rate control algorithm.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
