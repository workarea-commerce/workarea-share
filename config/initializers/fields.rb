Workarea::Configuration.define_fields do
  fieldset 'Communication', namespaced: false do
    field 'Max Email Share Message Length',
      type: :integer,
      default: 2000,
      description: %(
        The maximum message length (in characters) that an email share
        can contain. Used in the 'Share by Email' option on product detail pages.
      ).squish
  end
end
