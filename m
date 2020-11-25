Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m42-4.mailgun.net ([69.72.42.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khljJ-00014Q-54
 for ath10k@lists.infradead.org; Wed, 25 Nov 2020 03:44:31 +0000
From: "Rakesh Pillai" <pillair@codeaurora.org>
References: <20201112200906.991086-1-kuabhs@chromium.org>
 <20201112200856.v2.1.Ia526132a366886e3b5cf72433d0d58bb7bb1be0f@changeid>
 <CAD=FV=XKCLgL6Bt+3KfqKByyP5fpwXOh6TNHXAoXkaQJRzjKjQ@mail.gmail.com>
 <002401d6c242$d78f2140$86ad63c0$@codeaurora.org>
 <CAD=FV=UnecON-M9eZVQePuNpdygN_E9OtLN495Xe1GL_PA94DQ@mail.gmail.com>
In-Reply-To: <CAD=FV=UnecON-M9eZVQePuNpdygN_E9OtLN495Xe1GL_PA94DQ@mail.gmail.com>
Subject: RE: [PATCH v2 1/1] ath10k: add option for chip-id based BDF selection
Date: Wed, 25 Nov 2020 09:14:16 +0530
Message-ID: <002d01d6c2dd$4386d880$ca948980$@codeaurora.org>
MIME-Version: 1.0
Content-Language: en-us
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
To: 'Doug Anderson' <dianders@chromium.org>
Cc: 'Abhishek Kumar' <kuabhs@chromium.org>, 'netdev' <netdev@vger.kernel.org>, 'Brian Norris' <briannorris@chromium.org>, 'linux-wireless' <linux-wireless@vger.kernel.org>, 'LKML' <linux-kernel@vger.kernel.org>, 'ath10k' <ath10k@lists.infradead.org>, 'Jakub Kicinski' <kuba@kernel.org>, "'David S. Miller'" <davem@davemloft.net>, 'Kalle Valo' <kvalo@codeaurora.org>



> -----Original Message-----
> From: Doug Anderson <dianders@chromium.org>
> Sent: Tuesday, November 24, 2020 9:56 PM
> To: Rakesh Pillai <pillair@codeaurora.org>
> Cc: Abhishek Kumar <kuabhs@chromium.org>; Kalle Valo
> <kvalo@codeaurora.org>; LKML <linux-kernel@vger.kernel.org>; ath10k
> <ath10k@lists.infradead.org>; Brian Norris <briannorris@chromium.org>;
> linux-wireless <linux-wireless@vger.kernel.org>; David S. Miller
> <davem@davemloft.net>; Jakub Kicinski <kuba@kernel.org>; netdev
> <netdev@vger.kernel.org>
> Subject: Re: [PATCH v2 1/1] ath10k: add option for chip-id based BDF
> selection
> 
> Hi,
> 
> On Tue, Nov 24, 2020 at 1:19 AM Rakesh Pillai <pillair@codeaurora.org>
> wrote:
> >
> > > -----Original Message-----
> > > From: Doug Anderson <dianders@chromium.org>
> > > Sent: Tuesday, November 24, 2020 6:27 AM
> > > To: Abhishek Kumar <kuabhs@chromium.org>
> > > Cc: Kalle Valo <kvalo@codeaurora.org>; Rakesh Pillai
> > > <pillair@codeaurora.org>; LKML <linux-kernel@vger.kernel.org>; ath10k
> > > <ath10k@lists.infradead.org>; Brian Norris <briannorris@chromium.org>;
> > > linux-wireless <linux-wireless@vger.kernel.org>; David S. Miller
> > > <davem@davemloft.net>; Jakub Kicinski <kuba@kernel.org>; netdev
> > > <netdev@vger.kernel.org>
> > > Subject: Re: [PATCH v2 1/1] ath10k: add option for chip-id based BDF
> > > selection
> > >
> > > Hi,
> > >
> > > On Thu, Nov 12, 2020 at 12:09 PM Abhishek Kumar
> <kuabhs@chromium.org>
> > > wrote:
> > > >
> > > > In some devices difference in chip-id should be enough to pick
> > > > the right BDF. Add another support for chip-id based BDF selection.
> > > > With this new option, ath10k supports 2 fallback options.
> > > >
> > > > The board name with chip-id as option looks as follows
> > > > board name 'bus=snoc,qmi-board-id=ff,qmi-chip-id=320'
> > > >
> > > > Tested-on: WCN3990 hw1.0 SNOC WLAN.HL.3.2.2-00696-
> QCAHLSWMTPL-1
> > > > Tested-on: QCA6174 HW3.2 WLAN.RM.4.4.1-00157-QCARMSWPZ-1
> > > > Signed-off-by: Abhishek Kumar <kuabhs@chromium.org>
> > > > ---
> > > >
> > > > (no changes since v1)
> > >
> > > I think you need to work on the method you're using to generate your
> > > patches.  There are most definitely changes since v1.  You described
> > > them in your cover letter (which you don't really need for a singleton
> > > patch) instead of here.
> > >
> > >
> > > > @@ -1438,12 +1439,17 @@ static int
> > > ath10k_core_create_board_name(struct ath10k *ar, char *name,
> > > >         }
> > > >
> > > >         if (ar->id.qmi_ids_valid) {
> > > > -               if (with_variant && ar->id.bdf_ext[0] != '\0')
> > > > +               if (with_additional_params && ar->id.bdf_ext[0] != '\0')
> > > >                         scnprintf(name, name_len,
> > > >                                   "bus=%s,qmi-board-id=%x,qmi-chip-id=%x%s",
> > > >                                   ath10k_bus_str(ar->hif.bus),
> > > >                                   ar->id.qmi_board_id, ar->id.qmi_chip_id,
> > > >                                   variant);
> > > > +               else if (with_additional_params)
> > > > +                       scnprintf(name, name_len,
> > > > +                                 "bus=%s,qmi-board-id=%x,qmi-chip-id=%x",
> > > > +                                 ath10k_bus_str(ar->hif.bus),
> > > > +                                 ar->id.qmi_board_id, ar->id.qmi_chip_id);
> > >
> > > I believe this is exactly opposite of what Rakesh was requesting.
> > > Specifically, he was trying to eliminate the extra scnprintf() but I
> > > think he still agreed that it was a good idea to generate 3 different
> > > strings.  I believe the proper diff to apply to v1 is:
> > >
> > > https://crrev.com/c/255643
> 
> Wow, I seem to have deleted the last digit from my URL.  Should have been:
> 
> https://crrev.com/c/2556437
> 
> > >
> > > -Doug
> >
> > Hi Abhishek/Doug,
> >
> > I missed on reviewing this change. Also I agree with Doug that this is not
> the change I was looking for.
> >
> > The argument "with_variant" can be renamed to "with_extra_params".
> There is no need for any new argument to this function.
> > Case 1: with_extra_params=0,  ar->id.bdf_ext[0] = 0             ->   The default
> name will be used (bus=snoc,qmi_board_id=0xab)
> > Case 2: with_extra_params=1,  ar->id.bdf_ext[0] = 0             ->
> bus=snoc,qmi_board_id=0xab,qmi_chip_id=0xcd
> > Case 3: with_extra_params=1,  ar->id.bdf_ext[0] = "xyz"      ->
> bus=snoc,qmi_board_id=0xab,qmi_chip_id=0xcd,variant=xyz
> >
> > ar->id.bdf_ext[0] depends on the DT entry for variant field.
> 
> I'm confused about your suggestion.  Maybe you can help clarify.  Are
> you suggesting:
> 
> a) Only two calls to ath10k_core_create_board_name()
> 
> I'm pretty sure this will fail in some cases.  Specifically consider
> the case where the device tree has a "variant" defined but the BRD
> file only has one entry for (board-id) and one for (board-id +
> chip-id) but no entry for (board-id + chip-id + variant).  If you are
> only making two calls then I don't think you'll pick the right one.
> 
> Said another way...
> 
> If the device tree has a variant:
> 1. We should prefer a BRD entry that has board-id + chip-id + variant
> 2. If #1 isn't there, we should prefer a BRD entry that has board-id + chip-id
> 3. If #1 and #2 aren't there we fall back to a BRD entry that has board-id.
> 
> ...without 3 calls to ath10k_core_create_board_name() we can't handle
> all 3 cases.

This can be handled by two calls to ath10k_core_create_board_name
1) ath10k_core_create_board_name(ar, boardname, sizeof(boardname), true)   :  As per my suggestions, this can result in two possible board names
    a) If DT have the "variant" node, it outputs the #1 from your suggestion  (1. We should prefer a BRD entry that has board-id + chip-id + variant)
    b) If DT does not have the "variant" node, it outputs the #2 from your suggestion (2. If #1 isn't there, we should prefer a BRD entry that has board-id + chip-id)

2) ath10k_core_create_board_name(ar, boardname, sizeof(boardname), false)    :  This is the second call to this function and outputs the #3 from your suggestion (3. If #1 and #2 aren't there we fall back to a BRD entry that has board-id)


Below is the snippet of code change I am suggesting. 

 static int ath10k_core_create_board_name(struct ath10k *ar, char *name,
-                                        size_t name_len, bool with_variant)
+                                        size_t name_len, bool with_extra_params)
 {
        /* strlen(',variant=') + strlen(ar->id.bdf_ext) */
        char variant[9 + ATH10K_SMBIOS_BDF_EXT_STR_LENGTH] = { 0 };

-       if (with_variant && ar->id.bdf_ext[0] != '\0')
+       if (ar->id.bdf_ext[0] != '\0')
                scnprintf(variant, sizeof(variant), ",variant=%s",
                          ar->id.bdf_ext);

@@ -1493,7 +1493,7 @@ static int ath10k_core_create_board_name(struct ath10k *ar, char *name,
        }

        if (ar->id.qmi_ids_valid) {
-               if (with_variant && ar->id.bdf_ext[0] != '\0')
+               if (with_extra_params)
                        scnprintf(name, name_len,
                                  "bus=%s,qmi-board-id=%x,qmi-chip-id=%x%s",
                                  ath10k_bus_str(ar->hif.bus),


Thanks,
Rakesh Pillai.

> 
> 
> b) Three calls to ath10k_core_create_board_name() but the caller
> manually whacks "ar->id.bdf_ext[0]" for one of the calls
> 
> This doesn't look like it's a clean solution, but maybe I'm missing something.
> 
> 
> -Doug


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
