Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-we0-x231.google.com ([2a00:1450:400c:c03::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X7jKG-0004E8-RQ
 for ath10k@lists.infradead.org; Thu, 17 Jul 2014 10:54:14 +0000
Received: by mail-we0-f177.google.com with SMTP id w62so2363962wes.22
 for <ath10k@lists.infradead.org>; Thu, 17 Jul 2014 03:53:49 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <EE97821C81277E459BEA5C6384C6F241012F15C1D7EB@srvexch01.SODIELEC.local>
References: <30258C2D-7A80-42C1-8AE7-713C490ABF05@st-andrews.ac.uk>
 <53C6A1C7.5060004@intec.ugent.be>
 <CA+BoTQ==9HQrPxp3qZGwEm_a3wQY_wMW5ckrbSRu+MkxU1HRgw@mail.gmail.com>
 <EE97821C81277E459BEA5C6384C6F241012F15C1D7EB@srvexch01.SODIELEC.local>
Date: Thu, 17 Jul 2014 12:53:46 +0200
Message-ID: <CACKGw+HM-VYpotQGcTsanebvfU-4iGocOpbbGak7iUDb7sUURA@mail.gmail.com>
Subject: Re: Trouble shooting low rate MCS9 in 802.11ac
From: Bartosz Markowski <bartosz.markowski@tieto.com>
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
Cc: Patrick CARNEIRO RODRIGUEZ <p.carneiro@actiasodielec.fr>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 17 July 2014 12:40, Vu Hai NGUYEN <vh.nguyen@actiasodielec.fr> wrote:
> Hi all,
> I'm using ath10k with official firmware (10.1, 467-2-1), my module of wifi is Compex WLE900VX.
> In theory MCS9 should give better rate than MCS 7.
> But when running test with Iperf, I notice that if I force rate (using command "iw") to MCS9 or MCS8,
> the rate result from iperf are always lower than MCS 7 (even NSS1,2 or 3).
> Though I check RX rate report from "iw station dump" and it matches with the rate that I want to force.
> You can see in the attached file a report of my test.
> Any one has done the test and get better rate in MCS9 than in MCS7 with this wifi module ???

Did you use cables or measured OTA? What platform it is? Did you use
hostapd? Is it AP mode (bridge)?
(You did not provide basically any details on what exacly you've measured).

In open AP mode (bridge), CUS223 HW (not WLE900VX however) and on
AP135 platform (customized openwrt SW + bleeding edge of
ath10k/wireless subsystem souces - private backports tarball).. for
UDP (last time I measured) I have around 820Mpbs for UCP both ways and
720Mbps TCP.

-Bartosz

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
