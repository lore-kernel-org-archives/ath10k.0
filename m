Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1ccKaI-0002w7-9W
 for ath10k@lists.infradead.org; Fri, 10 Feb 2017 23:26:38 +0000
Subject: Re: VHT 160Mhz and nss related config.
References: <0082a9e3-83f3-9bc3-af43-b890b91cfd93@candelatech.com>
 <CAJ-Vmo=-JBrkmUPcYrRbARYuWv_=-MeQpPwAN_0J3v8pA5mPnw@mail.gmail.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <c2e26f4e-f6a9-c662-b1a1-d0e0eb144af8@candelatech.com>
Date: Fri, 10 Feb 2017 15:26:13 -0800
MIME-Version: 1.0
In-Reply-To: <CAJ-Vmo=-JBrkmUPcYrRbARYuWv_=-MeQpPwAN_0J3v8pA5mPnw@mail.gmail.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Adrian Chadd <adrian.chadd@gmail.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On 02/10/2017 03:23 PM, Adrian Chadd wrote:
> Is it limited on both tx and rx or only one?

Both, as I understand it.  I think maybe we could use the max-tx-rate and max-rx-rate
fields in the vht mcs info field to give user-space a clue.

Thanks,
Ben

>
>
>
> Adrian
>
> On Feb 10, 2017 2:58 PM, "Ben Greear" <greearb@candelatech.com <mailto:greearb@candelatech.com>> wrote:
>
>     So, it appears that the ath10k QCA9984 4x4 160Mhz chip can do 4x4 MIMO at VHT80, but
>     it can do only 2x2 MIMO at VHT160/80+80.
>
>     When configuring a peer, we need to tell the firmware the number of spatial streams
>     of the peer at VHT160 and at VHT80 and lower.  They are not the same value.
>
>     I cannot think of any standard way to get this information based on VHT capabilities
>     and such.  Currently, one could just assume VHT160 NSS is 1/2 of the VHT80 NSS,
>     but that is unlikely to be true for all vendors.
>
>     Any ideas?
>
>     Thanks,
>     Ben
>
>     --
>     Ben Greear <greearb@candelatech.com <mailto:greearb@candelatech.com>>
>     Candela Technologies Inc  http://www.candelatech.com
>


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
