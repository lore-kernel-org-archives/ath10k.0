Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qt0-f182.google.com ([209.85.216.182])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eHuZt-0004rN-D1
 for ath10k@lists.infradead.org; Thu, 23 Nov 2017 16:42:37 +0000
Received: by mail-qt0-f182.google.com with SMTP id r58so28612184qtc.0
 for <ath10k@lists.infradead.org>; Thu, 23 Nov 2017 08:41:56 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <87zi7da458.fsf@kamboji.qca.qualcomm.com>
References: <CAGT1WQM6uiP6GHW9ukNUPf+JcZckENz514gg0DiR7CCO=5K+Fg@mail.gmail.com>
 <87zi7da458.fsf@kamboji.qca.qualcomm.com>
From: Konstantin Bogomolov <konstantin.bogomolov@dejero.com>
Date: Thu, 23 Nov 2017 11:41:54 -0500
Message-ID: <CAGT1WQO9y89Wz250zZs2qqGv7rut5C82Ncd4=XOKCLthnYrC3w@mail.gmail.com>
Subject: Re: Kernel panic hosting 5Ghz AP
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Hello Kalle,

The panic happens after hostapd outputs "ACS-STARTED". Usually, the
first attempt for me to start hostapd fails to create the AP (I think
this is a separate issue with the 5Ghz AP), but the second attempt
always initiates a panic on Debian 4.9 drivers.

I don't think this is a regression, because I saw the same behaviour
on a custom 4.1 kernel. I have also tried using backported drivers
from 4.12.0 to both 4.1 and 4.9, where the panic was also reproducible
on the second hostapd attempt, but didn't happen every time as it does
on Debian 4.9. So the AP did work on some occasions using the
backports, but the panic still happened very frequently. Sadly I don't
have logs at this time using those backports.

I'll try and reproduce this using a recent kernel and let you know the results.

Konstantin

On Thu, Nov 23, 2017 at 1:41 AM, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
> Konstantin Bogomolov <konstantin.bogomolov@dejero.com> writes:
>
>> I have an issue where I get a kernel panic upon hosting the following
>> AP with hostapd version 2.4 :
>>
>> # cat hostapd1.conf
>> interface=hotspot0
>> driver=nl80211
>> hw_mode=a
>> channel=0
>> ieee80211d=1
>> country_code=CA
>> ieee80211ac=1
>> ssid=test5
>> auth_algs=1
>> wpa=2
>> wpa_key_mgmt=WPA-PSK
>> rsn_pairwise=CCMP
>> wpa_passphrase=testtest
>>
>> I am using a stock Debian Stretch 4.9 kernel, with the latest ath10k
>> firmware. The card I am using is:
>>
>> 02:00.0 Network controller: Qualcomm Atheros QCA6174 802.11ac Wireless
>> Network Adapter (rev 32)
>>     Subsystem: AzureWave QCA6174 802.11ac Wireless Network Adapter
>>     Flags: bus master, fast devsel, latency 0, IRQ 326
>>     Memory at df000000 (64-bit, non-prefetchable) [size=2M]
>>     Capabilities: [40] Power Management version 3
>>     Capabilities: [50] MSI: Enable+ Count=1/8 Maskable+ 64bit-
>>     Capabilities: [70] Express Endpoint, MSI 00
>>     Capabilities: [100] Advanced Error Reporting
>>     Capabilities: [148] Virtual Channel
>>     Capabilities: [168] Device Serial Number 00-00-00-00-00-00-00-00
>>     Capabilities: [178] Latency Tolerance Reporting
>>     Capabilities: [180] L1 PM Substates
>>     Kernel driver in use: ath10k_pci
>>     Kernel modules: ath10k_pci
>>
>>
>> I get the following dmesg logs from the panic:
>>
>> [   84.211731] IPv6: ADDRCONF(NETDEV_UP): hotspot0: link is not ready
>> [   84.212359] BUG: unable to handle kernel NULL pointer dereference
>> at 0000000000000020
>> [   84.212410] IP: [<ffffffffaa8ed9ed>] skb_release_data+0x8d/0x110
>
> Did you see this once or multiple times? Are you able to reproduce the
> crash? Is this a regression (in other words did it work ok before)? At
> what stage exactly does it crash, do you need to do something special to
> make it crash?
>
> Trying out a recent vanilla kernel.org release would be helpful to
> pinpoint the problem as the Debian kernel might have custom patches
> causing problems.
>
> --
> Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
