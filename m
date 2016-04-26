Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from rudy.puc.rediris.es ([2001:720:418:ca01::132])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1av9Eq-0000wy-OJ
 for ath10k@lists.infradead.org; Tue, 26 Apr 2016 20:05:41 +0000
Subject: Re: enable 802.11h and 802.11d in IBSS mode
References: <571F60DE.2010705@cttc.cat> <571F9C90.9040205@codeaurora.org>
From: =?UTF-8?B?Sm9zZSBOw7rDsWV6LU1hcnTDrW5leiAoQ1RUQyk=?=
 <jose.nunez@cttc.cat>
Message-ID: <571FC9F8.9050209@cttc.cat>
Date: Tue, 26 Apr 2016 22:05:12 +0200
MIME-Version: 1.0
In-Reply-To: <571F9C90.9040205@codeaurora.org>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Peter Oh <poh@codeaurora.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

I'm not using wpa_supplicant. I'm directly using "iw" commands to =

configure the wireless cards.

Regards,
Jose

On 04/26/2016 06:51 PM, Peter Oh wrote:
>
> On 04/26/2016 05:36 AM, Jose Nunez-Martinez (CTTC) wrote:
>> Hi all,
>> I'm using ath10k in IBSS with 2 wireless cards based on qca988x.
>> How can I enable DFS (802.11h AND 802.11d) in IBSS mode (I mean =

>> there's not hostapd.conf file)?
>>
> As I understand, IBSS is using wpa_supplicant and wpa_supplicant does =

> not have DFS feature at this moment.
>
> Thanks,
> Peter
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k

-- =

Jose N=FA=F1ez-Mart=EDnez, PhD
Senior Researcher   email: jose.nunez@cttc.cat
COMNET Division     Web: http://networks.cttc.cat

Centre Tecnol=F2gic de Telecomunicacions de Catalunya (CTTC)
Parc Mediterrani de la Tecnologia
Av. Carl Friedrich Gauss, 7                Ph.:+34 936452927
08860 Castelldefels - Barcelona            Fax: +34 936452901


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
