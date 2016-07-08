Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-yw0-x243.google.com ([2607:f8b0:4002:c05::243])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bLXy4-0006uA-Ny
 for ath10k@lists.infradead.org; Fri, 08 Jul 2016 15:45:29 +0000
Received: by mail-yw0-x243.google.com with SMTP id l125so8962818ywb.1
 for <ath10k@lists.infradead.org>; Fri, 08 Jul 2016 08:45:08 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <577FC9D0.2010809@candelatech.com>
References: <CABPxzYLwye1t1Ycjr3nO5C18vc7OqS9dbbQ1yJ7B-YN+Bkx_PA@mail.gmail.com>
 <CABPxzYL5DHU7ZE1X1AibygBUz0TJEnNLLTp5_hDivmBBkjnVtg@mail.gmail.com>
 <1467972560885.99812@qti.qualcomm.com>
 <CABPxzY+8Y-FHUFALGueN1hQwgjJHNpeyy_BRkrM4osguxJZS0Q@mail.gmail.com>
 <1467982766213.21223@qti.qualcomm.com>
 <CABPxzYLO8rzvOJ_1iqng89kYFS-xqC3qstbgETVRJHDpO4rikQ@mail.gmail.com>
 <CABPxzYJPi4CqO+KUFA7=r=zpq_c2vFtrgBQ+nF_nThO-cYrteg@mail.gmail.com>
 <CABPxzYKOqBmrjRwAyZV9daV8adEhUV71XEAsfrLhtTnKwWzuaw@mail.gmail.com>
 <577FC9D0.2010809@candelatech.com>
From: Krishna Chaitanya <chaitanya.mgit@gmail.com>
Date: Fri, 8 Jul 2016 21:14:48 +0530
Message-ID: <CABPxzYLdS-QicOj9AdcubT8uxgw0cqXpzerpuwGcwkSQ7PCiOA@mail.gmail.com>
Subject: Re: ath10k + iw set bitrates is causing FW crash
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
To: Ben Greear <greearb@candelatech.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "Manoharan,
 Rajkumar" <rmanohar@qti.qualcomm.com>, ath10k <ath10k@lists.infradead.org>

On Fri, Jul 8, 2016 at 9:12 PM, Ben Greear <greearb@candelatech.com> wrote:
> On 07/08/2016 08:39 AM, Krishna Chaitanya wrote:
>
>> Also can you please tell me how to make ath10k use minstrel rc, its needed
>> for comparative purposes? Is disable HW_RATE_CONTROL enough or does
>> it need more changes?
>
>
> It cannot be done.  You have to use whatever rate-ctrl is baked into the
> firmware.
Ok, its a good feature to have.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
