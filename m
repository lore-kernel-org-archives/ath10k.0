Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mailhost.actiasodielec.fr ([89.91.64.97])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XMCBg-0001xs-Ft
 for ath10k@lists.infradead.org; Tue, 26 Aug 2014 08:33:09 +0000
From: Vu Hai NGUYEN <vh.nguyen@actiasodielec.fr>
Date: Tue, 26 Aug 2014 10:32:23 +0200
Subject: RE : RE : Trouble shooting low rate MCS9 in 802.11ac
Message-ID: <EE97821C81277E459BEA5C6384C6F24101683828F75F@srvexch01.SODIELEC.local>
References: <30258C2D-7A80-42C1-8AE7-713C490ABF05@st-andrews.ac.uk>
 <53C6A1C7.5060004@intec.ugent.be>
 <CA+BoTQ==9HQrPxp3qZGwEm_a3wQY_wMW5ckrbSRu+MkxU1HRgw@mail.gmail.com>
 <EE97821C81277E459BEA5C6384C6F241012F15C1D7EB@srvexch01.SODIELEC.local>
 <CACKGw+HM-VYpotQGcTsanebvfU-4iGocOpbbGak7iUDb7sUURA@mail.gmail.com>
 <EE97821C81277E459BEA5C6384C6F241012F15C1D7EC@srvexch01.SODIELEC.local>,
 <CACKGw+HraUvPSVprRQCEh0=MRaiahpGde9wUj-w5pbDtXSj8Yw@mail.gmail.com>
In-Reply-To: <CACKGw+HraUvPSVprRQCEh0=MRaiahpGde9wUj-w5pbDtXSj8Yw@mail.gmail.com>
Content-Language: fr-FR
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
To: Bartosz Markowski <bartosz.markowski@tieto.com>
Cc: Patrick CARNEIRO RODRIGUEZ <p.carneiro@actiasodielec.fr>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

>So probably the air condition you have forces the rate control to pick
>MCS7 as the most suitable rates.

>>>In open AP mode (bridge), CUS223 HW (not WLE900VX however) and on
>>>AP135 platform (customized openwrt SW + bleeding edge of
>>>ath10k/wireless subsystem souces - private backports tarball).. for
>>>UDP (last time I measured) I have around 820Mpbs for UCP both ways and
>>>720Mbps TCP.
>>
>> This is in NSS3 -MCS9? Did you get better or worse rate if you clear the mask
>> (iw wlanX set bitrates) cause if I don't config rate, from AP to STA I have the best rate
>> (ie same as MCS7) but from STA to AP my rate is much lower than MCS7 (240 Mbps
>> vs 370 Mbps in TCP).

>Yes, NSS-3; Over the RF-cables I'm easily able to get MCS9 rates
>transmitions without any forced settings (the rate control is picking
>the highest rates).

Hi Bartosz,
I connect 2 antennas on my 2 devices together by a RF-cables with an attenuator around -60dBm, config 
each device to use one antenna and force rate to NSS1. But the TCP through put of MCS7 (230 Mbps) is 
always slightly higher than MCS8 (210Mbps) and 9 (190Mbps).
Can you give me some detail about your RF-cables test-bed? (for example which attenuator did you use?,etc...)
Thank you in advance.

NGUYEN Vu Hai
Acita-Sodielec
Route de Mayres - B.P. 9
12100 St GEORGES DE LUZENCON
FRANCE




_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
