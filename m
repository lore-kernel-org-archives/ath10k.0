Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
MIME-Version: 1.0
References: <CABPxzYK=jmERyvryoy274gtDEBft-BUMjOBsDhjVd+xQu-tQLg@mail.gmail.com>
In-Reply-To: <CABPxzYK=jmERyvryoy274gtDEBft-BUMjOBsDhjVd+xQu-tQLg@mail.gmail.com>
From: Krishna Chaitanya <chaitanya.mgit@gmail.com>
Date: Fri, 7 Sep 2018 19:56:40 +0530
Message-ID: <CABPxzYKUEr1R8Bt+hVNVQr6CoHwSOiTi6-cMFwFiNwzG-VEZDA@mail.gmail.com>
Subject: Re: ath10k: adding wlan to bridge causes WPA2-PSK to fail
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
To: "Hostap@lists.infradead.org" <hostap@lists.infradead.org>, linux-wireless <linux-wireless@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>

On Tue, Aug 28, 2018 at 9:47 PM Krishna Chaitanya
<chaitanya.mgit@gmail.com> wrote:
>
> Hi,
>
> I am trying to connect ath10k interface to Linux bridge after enabling
> of 4addr mode in WPA2-PSK mode, but EAPOL handshake fails, M1 is
> not received by the wpa_supplicant.
Did not pass "-b br0" to the wpa_supplicant so l2 bridge code is not
initialized.
After passing, it works fine. Thanks.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
