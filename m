Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x234.google.com ([2a00:1450:400c:c09::234])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bUuQu-0006iO-L6
 for ath10k@lists.infradead.org; Wed, 03 Aug 2016 11:33:57 +0000
Received: by mail-wm0-x234.google.com with SMTP id o80so331651858wme.1
 for <ath10k@lists.infradead.org>; Wed, 03 Aug 2016 04:33:34 -0700 (PDT)
Subject: Re: [RFC] ath10k: silence firmware file probing warnings
References: <1468933237-5226-1-git-send-email-michal.kazior@tieto.com>
 <20160721070938.GA2658@redhat.com>
 <CANUX_P3ADxi+RHkH=d8Ypcqy9WVKSu4JYH7K3HtTNCuWg3wCeQ@mail.gmail.com>
 <20160721080541.GB2658@redhat.com> <5790A28F.8030102@redhat.com>
 <20160721115122.GA31869@redhat.com>
 <a264e995-fc46-7fcd-69f9-80992385b6b1@broadcom.com>
 <20160722102559.GA2662@redhat.com> <20160722221523.GM5537@wotan.suse.de>
 <874m738m02.fsf@kamboji.qca.qualcomm.com>
 <20160802141610.GJ3296@wotan.suse.de>
From: Arend van Spriel <arend.vanspriel@broadcom.com>
Message-ID: <ae734397-6179-d0ba-3d8a-0cffc63a0fd8@broadcom.com>
Date: Wed, 3 Aug 2016 13:33:31 +0200
MIME-Version: 1.0
In-Reply-To: <20160802141610.GJ3296@wotan.suse.de>
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
To: "Luis R. Rodriguez" <mcgrof@kernel.org>, "Valo, Kalle" <kvalo@qca.qualcomm.com>
Cc: Prarit Bhargava <prarit@redhat.com>, Stanislaw Gruszka <sgruszka@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ming Lei <ming.lei@canonical.com>, linux-wireless <linux-wireless@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>, "mmarek@suse.com" <mmarek@suse.com>, "michal.kazior@tieto.com" <michal.kazior@tieto.com>, Arend van Spriel <arend@broadcom.com>, Emmanuel Grumbach <egrumbach@gmail.com>



On 02-08-16 16:16, Luis R. Rodriguez wrote:
> On Tue, Aug 02, 2016 at 11:10:22AM +0000, Valo, Kalle wrote:
>> "Luis R. Rodriguez" <mcgrof@kernel.org> writes:
>>
>>> I was considering this as a future extension to the firmware API
>>> through the new extensible firmware API, the sysdata API.
>>
>> I think Linus mentioned this already, but I want to reiterate anyway.
>> The name "sysdata" is horrible, I didn't have any idea what it means
>> until I read your description. Please continue to use the term
>> "firmware", anyone already know what it means.
> 
> We've gone well past using the firmware API for firmware though, if
> we use it for 802.11 to replace CRDA for instance its really odd to
> be calling it firmware. But sure... I will rebrand again to firmware...

I tend to agree. Although some people even call an OpenWrt image
firmware. Guess it is just in the eye of the beholder.

Regards,
Arend

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
