Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mailsrv0.aau.at ([143.205.180.48] helo=mailsrv.uni-klu.ac.at)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XEf5P-0004Fd-9Z
 for ath10k@lists.infradead.org; Tue, 05 Aug 2014 13:47:32 +0000
From: "Hayat, Samira" <Samira.Hayat@aau.at>
Subject: Re: ath10k with hostapd
Date: Tue, 5 Aug 2014 13:47:01 +0000
Message-ID: <eb55c11a30ae4d32a821d7db6b54d18f@exmbx1.ad.aau.at>
References: <9087ccfa9e9346eb808c2b0f61259744@exmbx1.ad.aau.at>
 <CA+BoTQ=VGtqKL1CBF_pAgzkdd9sKZ7Du=YfaP9MRqoDbeu5Wtg@mail.gmail.com>
Content-Language: en-US
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Michal Kazior <michal.kazior@tieto.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 8/5/2014 3:11 PM, Michal Kazior wrote:
> On 5 August 2014 14:59, Hayat, Samira <Samira.Hayat@aau.at> wrote:
>> Hi,
>>
>> I have been trying to get hostapd running for 80211ac. I have a card
>> that supports n/ac. I used backports to get ath10k running on my kernel.
>> the output of
>>
>> lsmod | grep ath10k
>>
>> is:
>>
>> ath10k_pci             41185     0
>> ath10k_core           137353  1 ath10k_pci
>> mac80211              613458  1 ath10k_core
>> ath                           28966    1 ath10k_core
>> cfg80211                 586956  3 ath10k_core,mac80211,ath
>> compat                    29841    3 ath10k_pci,mac80211,cfg80211
>>
>> I have tried running hostapd with config_80211n and config_80211ac
>> enabled in the .config file. Even having done that, I get
>>
>> Configuration file: ./hostapd-minimal.conf
>> Line 8: unknown configuration item 'ht_capab'
>> Line 9: unknown configuration item 'ieee80211n'
>> Line 10: unknown configuration item 'ieee80211ac'
>> Line 11: unknown configuration item 'vht_oper_chwidth'
>> Line 12: unknown configuration item 'vht_oper_centr_freq_seg0_idx'
>> 5 errors found in configuration file './hostapd-minimal.conf'
>> Failed to set up interface with ./hostapd-minimal.conf
>> Failed to initialize interface
> Your hostapd doesn't seem to have 11n nor 11ac support compiled in.
> You might reconsider taking a look at your hostapd's .config file
> again. You can compare it with mine: http://pastebin.com/NG58DWuq
>
>
> Micha=B3
>
This is my .config file:

CONFIG_DRIVER_HOSTAP=3Dy
CONFIG_DRIVER_NL80211=3Dy

CONFIG_IAPP=3Dy
CONFIG_RSN_PREAUTH=3Dy
CONFIG_PEERKEY=3Dy
CONFIG_IEEE80211W=3Dy
CONFIG_EAP=3Dy
CONFIG_EAP_MD5=3Dy
CONFIG_EAP_TLS=3Dy
CONFIG_EAP_MSCHAPV2=3Dy
CONFIG_EAP_PEAP=3Dy
CONFIG_EAP_GTC=3Dy
CONFIG_EAP_TTLS=3Dy
CONFIG_IPV6=3Dy

CONFIG_IEEE80211N=3Dy
CONFIG_IEEE80211AC=3Dy

CONFIG_ACS=3Dy

Just the minimum requirements to get 802.11ac running. Am I missing
something?

Regards,
Samira





_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
