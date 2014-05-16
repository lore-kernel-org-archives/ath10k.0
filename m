Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lb0-x22f.google.com ([2a00:1450:4010:c04::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WlC19-00086z-0w
 for ath10k@lists.infradead.org; Fri, 16 May 2014 06:53:19 +0000
Received: by mail-lb0-f175.google.com with SMTP id l4so1595058lbv.34
 for <ath10k@lists.infradead.org>; Thu, 15 May 2014 23:52:54 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <EE97821C81277E459BEA5C6384C6F241012F109978D1@srvexch01.SODIELEC.local>
References: <EE97821C81277E459BEA5C6384C6F241012F0EFBBCBD@srvexch01.SODIELEC.local>
 <5373382C.1030709@elisanet.fi>
 <EE97821C81277E459BEA5C6384C6F241012F109978C9@srvexch01.SODIELEC.local>
 <DUB122-W4070B8F41A0F8A25061141CB360@phx.gbl>
 <EE97821C81277E459BEA5C6384C6F241012F109978CE@srvexch01.SODIELEC.local>
 <CALhHN=pGozL43B+qiJ20it3QCkvKkOL_RynfvUod_Ert8v1+3Q@mail.gmail.com>
 <EE97821C81277E459BEA5C6384C6F241012F109978CF@srvexch01.SODIELEC.local>
 <EE97821C81277E459BEA5C6384C6F241012F109978D1@srvexch01.SODIELEC.local>
Date: Fri, 16 May 2014 08:52:54 +0200
Message-ID: <CALhHN=q_kuaszuBdsWHLZJYEA1PW63AqDFiF89DC3c4pOJseOg@mail.gmail.com>
Subject: Re: RE : RE : RE : ath10k: set channel by command "iw" not from
 hostapd and DFS support of firmware-2.bin_10.1.467.2-1
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
Cc: Patrick CARNEIRO RODRIGUEZ <p.carneiro@actiasodielec.fr>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Matti Laakso <malaakso@elisanet.fi>

On 15 May 2014 18:08, Vu Hai NGUYEN <vh.nguyen@actiasodielec.fr> wrote:
>
>
>
>>Nope, CAC time is not required to start CAC (in case cac == 0 kernel
>>will use default value 60s).
>>What error you have EBUSY or EINVAL?
>>What system (PC kernel, wireless ...) configuration?
>
> Ah I run hostapd with debug option and got a mess that told me:
> nl80211: Failed to start radar detection, device or resource busy => I guess this is EBUSY.
>

OK then. EBUSY you get when you don't have correct combination (DFS
combination is not present).
Which suggest for some reason your configuration didn't activate
CONFIG_ATH10K_DFS_CERTIFIED.
Check iw list, you shuld see:
radar detect widths: { 20 MHz (no HT), 20 MHz, 40 MHz, 80 MHz }


BR
Janusz

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
