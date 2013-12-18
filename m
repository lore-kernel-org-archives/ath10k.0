Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VtB6g-0004vm-FA
 for ath10k@lists.infradead.org; Wed, 18 Dec 2013 06:59:47 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: Cannot use 80MHz channel
References: <CAHR6CfXUBFTq=EDHwa3dNL21VaBvQ8sOeW+JYeUAtv7zg28rLA@mail.gmail.com>
 <CA+BoTQ=hnirSQhgydH9DQdx+1A3WUV+gMUCMOQGP8yvew8jF-g@mail.gmail.com>
Date: Wed, 18 Dec 2013 08:59:19 +0200
In-Reply-To: <CA+BoTQ=hnirSQhgydH9DQdx+1A3WUV+gMUCMOQGP8yvew8jF-g@mail.gmail.com>
 (Michal Kazior's message of "Wed, 18 Dec 2013 07:15:00 +0100")
Message-ID: <87ppoubq60.fsf@kamboji.qca.qualcomm.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: Li Sun <lsun3@buffalo.edu>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Michal Kazior <michal.kazior@tieto.com> writes:

> On 17 December 2013 22:51, Li Sun <lsun3@buffalo.edu> wrote:
>> Hi,
>>
>> I am trying to play around with the ath10k driver. I have two Qualcomm
>> Atheros QCA9880 Version 2 802.11ac chipsets. I put one of the cards in
>> AP mode using hostapd and connect the other one as a client.
>>
>> I am using the hostapd config mentioned at
>> "wireless.kernel.org/en/users/Drivers/ath10k/configuration". The
>> client connects but the throughput is just around 300 Mbps (suggesting
>> 40 MHz channel-width) and NOT any higher. It seems I am unable to use
>> the 80 MHz channel-width. Also, when I checked the kernel logs
>> (dmesg), I found the following message on the client side only:
>>
>> capabilities/regulatory prevented using AP HT/VHT configuration, downgraded
>>
>>
>> Could this problem be related to CRDA ? I am in the US.
>
> Check output of `iw reg get`. If you see no entries with `@ 80` you
> have to upgrade your regdb.

And the easiest way to do that (if you compile your own kernels) is to
enable CONFIG_CFG80211_INTERNAL_REGDB and copy db.txt from
wireless-regdb to net/wireless/db.txt.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
