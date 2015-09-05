Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vk0-x231.google.com ([2607:f8b0:400c:c05::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZYJds-0006Tv-P2
 for ath10k@lists.infradead.org; Sat, 05 Sep 2015 20:00:53 +0000
Received: by vkhf67 with SMTP id f67so26906306vkh.1
 for <ath10k@lists.infradead.org>; Sat, 05 Sep 2015 13:00:27 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <F52F175DFC537F48A43937B50B44BCA28205CDDC@EXCHANGE.mediaspot.local>
References: <F52F175DFC537F48A43937B50B44BCA28205CDDC@EXCHANGE.mediaspot.local>
Date: Sat, 5 Sep 2015 22:00:27 +0200
Message-ID: <CALhHN=psNe5hh3GuA=z0AC6-Gy-fRTkxUe3+Pop3OMyBwPpshQ@mail.gmail.com>
Subject: Re: IBSS-RSN support on ath10k only links
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
To: Alessandro Bolletta <alessandro@mediaspot.net>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 5 September 2015 at 17:08, Alessandro Bolletta
<alessandro@mediaspot.net> wrote:
> Hi,
> What efforts could be needed in order to make IBSS-RSN working on ath10k <--> ath10k links? Is there anybody working actively on it?
>
We did basic testing/implementation using ath10k/ath9k, wpa_supplicant
and main (636) firmware and qca6174.
Latest code already have WIPHY_FLAG_IBSS_RSN set, so I expect this
should work. Some FW issues could be still possible :)

BR
Janusz

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
