Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.mediaspot.net ([185.37.180.5])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZYrCI-0002jL-Px
 for ath10k@lists.infradead.org; Mon, 07 Sep 2015 07:50:39 +0000
From: Alessandro Bolletta <alessandro@mediaspot.net>
Subject: R: IBSS-RSN support on ath10k only links
Date: Mon, 7 Sep 2015 07:48:07 +0000
Message-ID: <F52F175DFC537F48A43937B50B44BCA28205DA67@EXCHANGE.mediaspot.local>
References: <F52F175DFC537F48A43937B50B44BCA28205CDDC@EXCHANGE.mediaspot.local>
 <CALhHN=psNe5hh3GuA=z0AC6-Gy-fRTkxUe3+Pop3OMyBwPpshQ@mail.gmail.com>
In-Reply-To: <CALhHN=psNe5hh3GuA=z0AC6-Gy-fRTkxUe3+Pop3OMyBwPpshQ@mail.gmail.com>
Content-Language: it-IT
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
To: Janusz Dziedzic <janusz.dziedzic@tieto.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Ok, great!
Can you also tell me if is it everything working correctly with IBSS-RSN, such as VHT?
Alessandro

-----Messaggio originale-----
Da: Janusz Dziedzic [mailto:janusz.dziedzic@tieto.com] 
Inviato: sabato 5 settembre 2015 22.00
A: Alessandro Bolletta <alessandro@mediaspot.net>
Cc: ath10k@lists.infradead.org
Oggetto: Re: IBSS-RSN support on ath10k only links

On 5 September 2015 at 17:08, Alessandro Bolletta <alessandro@mediaspot.net> wrote:
> Hi,
> What efforts could be needed in order to make IBSS-RSN working on ath10k <--> ath10k links? Is there anybody working actively on it?
>
We did basic testing/implementation using ath10k/ath9k, wpa_supplicant and main (636) firmware and qca6174.
Latest code already have WIPHY_FLAG_IBSS_RSN set, so I expect this should work. Some FW issues could be still possible :)

BR
Janusz

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
