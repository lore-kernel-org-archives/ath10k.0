Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x229.google.com ([2a00:1450:400c:c05::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZN2DD-0007Ne-5j
 for ath10k@lists.infradead.org; Wed, 05 Aug 2015 17:10:44 +0000
Received: by wijp15 with SMTP id p15so56904641wij.0
 for <ath10k@lists.infradead.org>; Wed, 05 Aug 2015 10:10:21 -0700 (PDT)
Received: from [192.168.118.144] ([197.231.66.149])
 by smtp.googlemail.com with ESMTPSA id pg9sm5014830wjb.40.2015.08.05.10.10.20
 for <ath10k@lists.infradead.org> (version=TLSv1/SSLv3 cipher=OTHER);
 Wed, 05 Aug 2015 10:10:20 -0700 (PDT)
Subject: Re: qca6164 support
References: <CALiJtcqant1xGJTPpMpHj+zVAcY7gfN8UXy30sAdSd9QvsPJ1Q@mail.gmail.com>
 <CAMQd7mb63mBBP2V2kts7Y9K5TO25vp3E1RgGsF9-FL8hgxgZ+g@mail.gmail.com>
 <CALiJtcro6PzcFjJBt38UrZFwoM0BYU7x=Btw+k75Q1ryr2SU_Q@mail.gmail.com>
From: Alexandre Maloteaux <a.maloteaux@gmail.com>
Message-ID: <55C24373.20200@gmail.com>
Date: Wed, 5 Aug 2015 18:10:11 +0100
MIME-Version: 1.0
In-Reply-To: <CALiJtcro6PzcFjJBt38UrZFwoM0BYU7x=Btw+k75Q1ryr2SU_Q@mail.gmail.com>
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
To: ath10k@lists.infradead.org

Hi Victor

Concerning the timeout issue; i faced it on Archlinux with kvalo kernel.
The issue was related to the kernel option
CONFIG_FW_LOADER_USER_HELPER_FALLBACK (Fallback user-helper invocation
for firmware loading). This option if activated will create a 1 minute
timeout on each firmware try as udev does not implemented this feature
anymore.

Best Regards

On 08/05/2015 04:32 PM, Victor van Poppelen wrote:
>> I think you should have called your firmwware firmware-4.bin and not
>> -5.bin. In fact in the top of the file I have it says ">
>> firmware-4.bin". File names matters as far as I understood. Feel free
>> to check archives of this list I saw somebody talking about this
>> argument not long ago.
> I admit I foolishly only changed the name to firmware-5.bin to prevent
> the minute-long timeout (can we do something about that?), which is
> probably the same reason why others were doing it.  But in looking
> through the code, I can't find anywhere where the value of ar->fw_api
> actually affects driver behaviour.  Could you point me to where this
> value becomes important?
>
> Victor
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k
>


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
