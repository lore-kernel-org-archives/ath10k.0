Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eJlwN-0000fW-M2
 for ath10k@lists.infradead.org; Tue, 28 Nov 2017 19:53:13 +0000
From: Ryan Hsu <ryanhsu@qti.qualcomm.com>
Subject: Re: Kernel panic hosting 5Ghz AP
Date: Tue, 28 Nov 2017 19:52:47 +0000
Message-ID: <4151ab35-f726-ac33-4647-39aa89694148@qti.qualcomm.com>
References: <CAGT1WQM6uiP6GHW9ukNUPf+JcZckENz514gg0DiR7CCO=5K+Fg@mail.gmail.com>
 <87zi7da458.fsf@kamboji.qca.qualcomm.com>
 <CAGT1WQO9y89Wz250zZs2qqGv7rut5C82Ncd4=XOKCLthnYrC3w@mail.gmail.com>
 <87h8tg6y2t.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87h8tg6y2t.fsf@kamboji.qca.qualcomm.com>
Content-Language: en-US
Content-ID: <9EB4AAA024C07C47826AD3512052AEEA@qualcomm.com>
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
To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 11/26/2017 10:21 PM, Kalle Valo wrote:

> Konstantin Bogomolov <konstantin.bogomolov@dejero.com> writes:
>
>> Hello Kalle,
>>
>> The panic happens after hostapd outputs "ACS-STARTED". Usually, the
>> first attempt for me to start hostapd fails to create the AP (I think
>> this is a separate issue with the 5Ghz AP), but the second attempt
>> always initiates a panic on Debian 4.9 drivers.
>>
>> I don't think this is a regression, because I saw the same behaviour
>> on a custom 4.1 kernel. I have also tried using backported drivers
>> from 4.12.0 to both 4.1 and 4.9, where the panic was also reproducible
>> on the second hostapd attempt, but didn't happen every time as it does
>> on Debian 4.9. So the AP did work on some occasions using the
>> backports, but the panic still happened very frequently. Sadly I don't
>> have logs at this time using those backports.
>>
>> I'll try and reproduce this using a recent kernel and let you know the results.
> Also try without ACS (meaning specify a channel mannually hostapd config
> file) just to see if the crash is ACS related.

I ran quick testing on my setup on 4.1.33 kernel
 - ath10k driver on top of with 4.14/4.13/4.9
 - hostapd with 2.4, 2.5 and 2.6
 - using your ap.conf

I didn't see any crash, maybe you want to help to run some testing to figure out the difference?

--
version:        backported from Linux (v3.18-211231-g569dbb8) using backports v4.14-rc2-1-34-g1d8cc15

sudo ./hostapd /tmp/ap.conf
Configuration file: /tmp/ap.conf
wlan0: interface state UNINITIALIZED->COUNTRY_UPDATE
ACS: Automatic channel selection started, this may take a bit
wlan0: interface state COUNTRY_UPDATE->ACS
wlan0: ACS-STARTED
wlan0: ACS-COMPLETED freq=5785 channel=157
Using interface wlan0 with hwaddr 00:03:7f:87:84:97 and ssid "test5_ryan"
wlan0: interface state ACS->ENABLED
wlan0: AP-ENABLED

[1]+  Stopped                 sudo ./hostapd ~/ap.conf

./hostapd -v
hostapd v2.4
User space daemon for IEEE 802.11 AP management,
IEEE 802.1X/WPA/WPA2/EAP/RADIUS Authenticator
Copyright (c) 2002-2015, Jouni Malinen <j@w1.fi> and contributors
--

-- 
Ryan Hsu

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
