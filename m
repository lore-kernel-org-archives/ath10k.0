Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mailsrv0.aau.at ([143.205.180.48] helo=mailsrv.uni-klu.ac.at)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XEfxv-0003rh-MX
 for ath10k@lists.infradead.org; Tue, 05 Aug 2014 14:43:55 +0000
From: "Hayat, Samira" <Samira.Hayat@aau.at>
Subject: Re: ath10k with hostapd
Date: Tue, 5 Aug 2014 14:43:25 +0000
Message-ID: <ac122e2377c2400cb97bc527a978b620@exmbx1.ad.aau.at>
References: <9087ccfa9e9346eb808c2b0f61259744@exmbx1.ad.aau.at>
 <CA+BoTQ=VGtqKL1CBF_pAgzkdd9sKZ7Du=YfaP9MRqoDbeu5Wtg@mail.gmail.com>
 <eb55c11a30ae4d32a821d7db6b54d18f@exmbx1.ad.aau.at>
 <CACKGw+EMHNt69BG8UCp0xbdErhyOCM18qT_4B+A0=Mb0E8we3w@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Bartosz Markowski <bartosz.markowski@tieto.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 8/5/2014 4:32 PM, Bartosz Markowski wrote:
> On 5 August 2014 15:47, Hayat, Samira <Samira.Hayat@aau.at> wrote:
>
> [...]
>
>> This is my .config file:
>>
>> CONFIG_DRIVER_HOSTAP=y
>> CONFIG_DRIVER_NL80211=y
>>
>> CONFIG_IAPP=y
>> CONFIG_RSN_PREAUTH=y
>> CONFIG_PEERKEY=y
>> CONFIG_IEEE80211W=y
>> CONFIG_EAP=y
>> CONFIG_EAP_MD5=y
>> CONFIG_EAP_TLS=y
>> CONFIG_EAP_MSCHAPV2=y
>> CONFIG_EAP_PEAP=y
>> CONFIG_EAP_GTC=y
>> CONFIG_EAP_TTLS=y
>> CONFIG_IPV6=y
>>
>> CONFIG_IEEE80211N=y
>> CONFIG_IEEE80211AC=y
>>
>> CONFIG_ACS=y
> Then are you sure you are executing the hostapd exec you have actually
> compiled, not the distro one?
>
> -Bartosz
>
I think so. I changed the path for DAEMON_SBIN in /etc/init.d/hostapd to
point to my compiled one.

Samira.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
