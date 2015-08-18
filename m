Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZRjUj-0006Dx-Tt
 for ath10k@lists.infradead.org; Tue, 18 Aug 2015 16:12:14 +0000
Message-ID: <55D35948.7060008@candelatech.com>
Date: Tue, 18 Aug 2015 09:11:52 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: CT ath10k firmware now supports IBSS + RSN
References: <55285D8D.6070703@candelatech.com> <1701816.PemaYpqoq5@bentobox>
 <55D1FEB2.4060205@candelatech.com> <4035168.MK6Xi4n7uL@bentobox>
In-Reply-To: <4035168.MK6Xi4n7uL@bentobox>
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
To: Sven Eckelmann <sven@open-mesh.com>
Cc: Marek Lindner <marek@open-mesh.com>, simon@open-mesh.com, "hostap@lists.shmoo.com" <hostap@lists.shmoo.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 08/18/2015 02:38 AM, Sven Eckelmann wrote:
> On Monday 17 August 2015 08:33:06 Ben Greear wrote: [...]
>>> * IBSS/RSN isn't working between ath10k<->ath10k, ath9k<->ath10k (works well between ath9k<->ath9k) - the ath10k device doesn't seem to send its
>>> broadcast frames after the handshake finished (ath9k already tries to transmit bcast frames) - also doesn't work with
>>> firmware-2-ct-non-commercial-full-14.bin and nohwcrypt=1
>> 
>> I believe I had ath10k to ath9k + RSN work, but I did see problems with ath10k-ath10k + RSN.
> 
> Yes, this was what I was reading in a different mail and also the reason why I've tried to get it working for ath9k<->ath10k. But unfortunately, I had no
> success.
> 
> I have also tried to use your config without the overrides and with overrides without any success.

I'm not sure if it matters, but I was using sw-crypt for both ath9k and ath10k
(and my patched kernel).

>> I think sometimes it worked a bit, and then stopped.  Truth is, my customers interested in IBSS are not doing encryption on the IBSS interface, so I have
>> no plans to work on this soon.  And, even if offered the opportunity, I'm not sure what I could do to improve the problem.  Possibly someone at QCA would
>> have ideas and might share them with me...
>> 
>> 
>>> * IBSS stops working everytime an AP interface is added to the same PHY (it isn't importing whether it is using WPA/WPA2 or configured as open AP) -
>>> tested again with ath9k on the same OpenWrt version and it working quite well with 1x IBSS + 2x AP
>> 
>> One of my customers is using AP + IBSS interface with no obvious problems related to concurrency.  But, maybe they are doing things in a different order.
>> Does it work for you if you bring up AP first and then add IBSS?
>> 
>> This is likely fixable.
> 
> I had to hack a little bit of OpenWrt away but it seems that it works for a simple setup to first create the adhoc interface and then sometimes later add
> the AP interface.

Ok, I'll make a note to test adding IBSS after AP.

Thanks,
Ben


- -- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.13 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBAgAGBQJV01k7AAoJELbHqkYeJT4Ol4kH/A1Vx0S76imRAVwVx9tXMmT5
zwAEa8vh9v5yF/URxaOiOhKgM0B4YB7Lt0hYgwp5zI9b+JEDpdA1Rj1EiaIAMnmb
Oj7r2f/LAKF1QHD3tZuPNa4v/L1+DwZ3K+zJ462pY6Yw9nOMvyiCRu/cONFJAY2U
dRyw+7tiHJfc11MfxXGNmUR60VyleNqGufZod+Ukh6QnJZHJUw9+xuYMDuugha48
oQ8WrbZIo4nHsg760zfwS6O5QMk3RxDztJnKjpt66uMNPP96zUz2PD38JmBF/H50
re3OHXaW1yGmblYA4AbPtrSyiS5+kaWnI6w6mSHMbhV/e13uL5MZ37Nhzxy81ao=
=XKv/
-----END PGP SIGNATURE-----

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
