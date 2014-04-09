Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from [2a01:4f8:131:30e2::2] (helo=nbd.name)
 by casper.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WXr0J-0004N3-Nv
 for ath10k@lists.infradead.org; Wed, 09 Apr 2014 11:49:20 +0000
Message-ID: <53453345.1000407@openwrt.org>
Date: Wed, 09 Apr 2014 13:47:17 +0200
From: Felix Fietkau <nbd@openwrt.org>
MIME-Version: 1.0
Subject: Re: [OpenWrt-Devel] WDS and adhoc support with ath10k
References: <603DB158-F608-47C8-AEE8-F0FCFD563699@gmail.com>
 <CAEFj984HyGGfWHNdpAkv4X0k=SBDu+ST9CyBdrfciXn8AZXgrw@mail.gmail.com>
 <874n22kb5r.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <874n22kb5r.fsf@kamboji.qca.qualcomm.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>, Yeoh Chun-Yeow <yeohchunyeow@gmail.com>
Cc: OpenWrt Development List <openwrt-devel@lists.openwrt.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 2014-04-09 13:14, Kalle Valo wrote:
> Yeoh Chun-Yeow <yeohchunyeow@gmail.com> writes:
> 
>>> Could someone confirm if WDS and adhoc mode currently don't have support with this driver?
>>
>> adhoc is working but not perfect, such as rate control not working, no
>> HT/VHT rate, and etc. You need to use the firmware version
>> 999.999.0.636.
>>
>> WDS should be working since 4 addresses has fixed by Michal:
>> http://lists.infradead.org/pipermail/ath10k/2014-February/001191.html
> 
> But the version of ath10k in openwrt is starting to become old, I doubt
> it has Michal's fix.
It was updated recently, to wireless-testing 2014-03-31

- Felix

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
