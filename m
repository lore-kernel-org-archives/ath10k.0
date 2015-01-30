Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wg0-x229.google.com ([2a00:1450:400c:c00::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YHFly-0007Le-1X
 for ath10k@lists.infradead.org; Fri, 30 Jan 2015 17:54:27 +0000
Received: by mail-wg0-f41.google.com with SMTP id a1so28287203wgh.0
 for <ath10k@lists.infradead.org>; Fri, 30 Jan 2015 09:53:58 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAFZrTr5q9mOTP7wfgok8n9hnzF8ACt6AT7ELEdu813PWuBDvDg@mail.gmail.com>
References: <CAFZrTr7Cy5OA-mgNM=K4SGOy2BKmHjFVRG2_0azS0=hNKW6zew@mail.gmail.com>
 <CALhHN=q+pL+JEC-n1bsa=WeksBKqbU336TcA3HsTKXz=7XCihQ@mail.gmail.com>
 <CAFZrTr6VaTo0it0pjjTeUx0JebDt6ayywr=Z9gm02-7i+WkPDg@mail.gmail.com>
 <CAFZrTr5q9mOTP7wfgok8n9hnzF8ACt6AT7ELEdu813PWuBDvDg@mail.gmail.com>
Date: Fri, 30 Jan 2015 18:53:57 +0100
Message-ID: <CALhHN=pmaYN8dB437W0mmxkJK_iPBC9nGv+bEQh2dsWDsyMZvQ@mail.gmail.com>
Subject: Re: Failed to start radar detection: -22 (Invalid argument)
From: Janusz Dziedzic <janusz.dziedzic@tieto.com>
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
To: Jeremias Blendin <jeremias@blendin.org>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 29 January 2015 at 20:57, Jeremias Blendin <jeremias@blendin.org> wrote:
> Sorry, forgot to add the list
>
> ---------- Forwarded message ----------
> From: Jeremias Blendin <jeremias@blendin.org>
> Date: 2015-01-29 20:29 GMT+01:00
> Subject: Re: Failed to start radar detection: -22 (Invalid argument)
> To: Janusz Dziedzic <janusz.dziedzic@tieto.com>
>
>
> Hi,
>
> thanks for the reply. I already use the latest regulatory db. If I set
> the country to DE or EU, I do not get DFS-ETSI. Also it seems that the
> driver stays with US when I use the modprobe config for cfg80211:
> [ 2230.123217] cfg80211: Calling CRDA for country: EU
> [ 2230.424986] ath10k_pci 0000:04:00.0: irq 87 for MSI/MSI-X
> [ 2230.475776] ath10k: pci irq MSI irq_mode 0 reset_mode 0
> [ 2231.454959] ath10k: qca988x hw2.0 (0x4100016c, 0x043202ff) fw
> 10.1.467.2-1 api 2 htt 2.1
> [ 2231.998004] ath: EEPROM regdomain: 0x0
> [ 2231.998009] ath: EEPROM indicates default country code should be used
> [ 2231.998012] ath: doing EEPROM country->regdmn map search
> [ 2231.998014] ath: country maps to regdmn code: 0x3a
> [ 2231.998016] ath: Country alpha2 being used: US
> [ 2231.998018] ath: Regpair used: 0x3a
> [ 2232.022444] systemd-udevd[4364]: renamed network interface wlan0 to wlan1
> [ 2233.275022] cfg80211: Calling CRDA for country: US
> [ 2233.278712] cfg80211: Regulatory domain changed to country: US
> [ 2233.278718] cfg80211:  DFS Master region: unset
> [ 2233.278720] cfg80211:   (start_freq - end_freq @ bandwidth),
> (max_antenna_gain, max_eirp), (dfs_cac_time)
> [ 2233.278724] cfg80211:   (2402000 KHz - 2472000 KHz @ 40000 KHz),
> (N/A, 3000 mBm), (N/A)
> [ 2233.278728] cfg80211:   (5170000 KHz - 5250000 KHz @ 80000 KHz,
> 160000 KHz AUTO), (N/A, 1700 mBm), (N/A)
> [ 2233.278731] cfg80211:   (5250000 KHz - 5330000 KHz @ 80000 KHz,
> 160000 KHz AUTO), (N/A, 2300 mBm), (0 s)
> [ 2233.278734] cfg80211:   (5735000 KHz - 5835000 KHz @ 80000 KHz),
> (N/A, 3000 mBm), (N/A)
> [ 2233.278737] cfg80211:   (57240000 KHz - 63720000 KHz @ 2160000
> KHz), (N/A, 4000 mBm), (N/A)
>
> When I use iw reg set DE this happens:
>
> # iw reg get
> country DE: DFS-UNSET
> (2400 - 2483 @ 40), (N/A, 20)
> (5150 - 5250 @ 80), (N/A, 20), NO-OUTDOOR
> (5250 - 5350 @ 80), (N/A, 20), NO-OUTDOOR, DFS
> (5470 - 5725 @ 160), (N/A, 26), DFS
> (57000 - 66000 @ 2160), (N/A, 40)
>
> Could it be that I need to change the EEPROM?
>
Try this options:
CONFIG_ATH_REG_DYNAMIC_USER_REG_HINTS=y
CONFIG_ATH_REG_DYNAMIC_USER_CERT_TESTING=y

After that iw reg set should work as expected.
One other thing could be two cards and "strange" cfg80211
intersection. In such case try to blacklist one card and try only with
ath10k loaded.

BR
Janusz

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
