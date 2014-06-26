Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X0AoX-0007u8-J0
 for ath10k@lists.infradead.org; Thu, 26 Jun 2014 14:38:17 +0000
Message-ID: <53AC303F.2040606@candelatech.com>
Date: Thu, 26 Jun 2014 07:37:51 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: Firmware crash
References: <53ABFFAC.1050603@stackframe.org>
 <CA+BoTQkm9BOtuvwY6h-z38WSe9rNw34V89A3bomAcY--T1vE9g@mail.gmail.com>
 <53AC1ABF.4020906@candelatech.com>
 <CAANdOW6yrv-Z_+bXw_z3zrmz=Q4N=r0xh9YitwwCoUAQchChLg@mail.gmail.com>
In-Reply-To: <CAANdOW6yrv-Z_+bXw_z3zrmz=Q4N=r0xh9YitwwCoUAQchChLg@mail.gmail.com>
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
To: Emanuel Taube <emanuel.taube@gmail.com>
Cc: Sven Schnelle <svens@stackframe.org>, Michal Kazior <michal.kazior@tieto.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 06/26/2014 07:33 AM, Emanuel Taube wrote:
> Hi Ben,
> 
> I am able to reproduce it with your firmware-2-ct-no-commercial-7.bin
> here is the crash dump:

Thanks.  I am going to have to update my decode program to parse
this...it doesn't look like 'normal' dmesg output on my systems.
Should have it done shortly...

Ben

> 
> assertion failed? pc=0x9a1a49, line=0, dump area=0x401930
> Target ID: 0x4100016c (1090519404)
> Debug Info:
> 0x4100016c 0x00000000 0x009a1a49 0x00000000 
> 0x00000000 0x00060324 0x00000000 0x00000000 
> 0x00000000 0x00000000 0x00000000 0x00000000 
> 0x00000000 0x00000000 0x00000000 0x00000000 
> 0x009b58cb 0x0094085d 0x00000000 0x009a1a49 
> 0x809430b8 0x00401a40 0x00000001 0x00000002 
> 0x80940975 0x00401a60 0x0000001f 0x00403bec 
> 0x409406b9 0x00401a80 0x0000001f 0x00419154 
> 0x00000000 0x00401aa0 0x00050024 0x00000000 
> 0x00000000 0x00000000 0x00000000 0x00000000 
> 0x00000000 0x00000000 0x00000000 0x00000000 
> 0x00000000 0x00000000 0x00000000 0x00000000 
> 0x00000000 0x00000000 0x00000000 0x00000000 
> 0x00000000 0x00000000 0x00000000 0x00000000 
> 
> to reproduce it I run 2 ath10k APs, one with the 
> WIPHY_FLAG_IBSS_RSN enabled and one without.
> Whichever AP starts first keeps running while the other one
> crashes when trying to start hostapd.
> 
> Thanks,
> Emanuel
> 
> 
> 2014-06-26 15:06 GMT+02:00 Ben Greear <greearb@candelatech.com <mailto:greearb@candelatech.com>>:
> 
> 
> 
>     On 06/26/2014 04:47 AM, Michal Kazior wrote:
> 
>             TSF id: 1, free_tsf_id_map: 1
>             assertion failed? pc=0x9a0e15, line=0, dump area=0x401930
>             Target ID: 0x4100016c (1090519404)
>             Debug Info:
>             0x4100016c 0x00000000 0x009a0e15 0x00000000
>             0x00000000 0x00000000 0x00000000 0x00000000
>             0x00000000 0x00000000 0x00000000 0x00000000
>             0x00000000 0x00000000 0x00000000 0x00000000
>             0x00000000 0x00000000 0x00000000 0x009a0e15
>             0x00000000 0x00401930 0x00000000 0x00000000
>             0x00000000 0x00000000 0x00000000 0x00000000
>             0x00000000 0x00000000 0x00000000 0x00000000
>             0x00000000 0x00000000 0x00000000 0x00000000
>             0x00000000 0x00000000 0x00000000 0x00000000
>             0x00000000 0x00000000 0x00000000 0x00000000
>             0x00000000 0x00000000 0x00000000 0x00000000
>             0x00000000 0x00000000 0x00000000 0x00000000
>             0x00000000 0x00000000 0x00000000 0x00000000
>             0x00000000 0x00000000 0x00000000 0x00000000
> 
> 
>         Apparently firmware crashes while processing a beacon frame with a
>         NULL dereference.
> 
> 
>     I fixed some issues in this area in my CT firmware, so you could
>     try it if you want.  If you can crash my firmware, please
>     send me the similar crash dump and I can probably fix it.
> 
>     Note this is not official QCA firmware, so any problems specific to
>     this firmware should be directed at me, and not QCA, and when reporting
>     general bugs (say, with driver), if you are using CT firmware be sure to
>     note that.
> 
>     http://www.candelatech.com/__ath10k.php <http://www.candelatech.com/ath10k.php>
> 
>     Thanks,
>     Ben
> 
>     -- 
>     Ben Greear <greearb@candelatech.com <mailto:greearb@candelatech.com>>
>     Candela Technologies Inc  http://www.candelatech.com
> 
> 
>     _________________________________________________
>     ath10k mailing list
>     ath10k@lists.infradead.org <mailto:ath10k@lists.infradead.org>
>     http://lists.infradead.org/__mailman/listinfo/ath10k <http://lists.infradead.org/mailman/listinfo/ath10k>
> 
> 


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
