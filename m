Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ig0-x22e.google.com ([2607:f8b0:4001:c05::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YVfuu-0002TX-1R
 for ath10k@lists.infradead.org; Wed, 11 Mar 2015 12:39:17 +0000
Received: by igdh15 with SMTP id h15so39077065igd.4
 for <ath10k@lists.infradead.org>; Wed, 11 Mar 2015 05:38:49 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1425905138-9966-1-git-send-email-marek.puzyniak@tieto.com>
References: <1425905138-9966-1-git-send-email-marek.puzyniak@tieto.com>
Date: Wed, 11 Mar 2015 13:38:49 +0100
Message-ID: <CADnKcVi-we6TSPMNgboS5B9ead7Xiv+tukNZhEiboN+Eb_x6Vg@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] ath10k: add basic tdls support
From: Marek Puzyniak <marek.puzyniak@tieto.com>
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
Cc: Marek Puzyniak <marek.puzyniak@tieto.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>

On 9 March 2015 at 13:45, Marek Puzyniak <marek.puzyniak@tieto.com> wrote:
> This patchset introduces tdls funtionality without tdls peer uapsd
> and tdls channel switching. Tdls is supported by qca6174 hardware
> what is indicated by firmware through supported services.
[...]
> Marek Puzyniak (2):
>   ath10k: make peer type configurable
>   ath10k: introduce basic tdls functionality
>
> Michal Kazior (1):
>   ath10k: unify tx mode and dispatch
[...]

Kalle, please drop this patchset. I will send new version.

Thanks,
Marek

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
